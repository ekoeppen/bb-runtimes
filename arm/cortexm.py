# This module contains cortex-m bsp support
from support.bsp import BSP
from support.target import Target


class CortexMArch(BSP):
    @property
    def name(self):
        return "cortex-m"

    def __init__(self):
        super(CortexMArch, self).__init__()
        self.add_sources('arch', [
            'src/s-macres__cortexm3.adb',
            'arm/src/breakpoint_handler-cortexm.S'])
        self.add_sources('gnarl', [
            'src/s-bbbosu__armv7m.adb',
            'src/s-bbcpsp__cortexm.ads',
            'src/s-bbcppr__old.ads',
            'src/s-bbcppr__armv7m.adb',
            'src/s-bbinte__generic.adb',
            'src/s-bbsumu__generic.adb',
            'src/s-bcpcst__armvXm.ads',
            'src/s-bcpcst__pendsv.adb'])


class CortexMTarget(Target):
    @property
    def target(self):
        return "arm-eabi"

    @property
    def parent(self):
        return CortexMArch

    @property
    def has_timer_64(self):
        return False

    @property
    def has_single_precision_fpu(self):
        return True

    @property
    def has_double_precision_fpu(self):
        return False

    @property
    def zfp_system_ads(self):
        return 'system-xi-arm.ads'

    @property
    def sfp_system_ads(self):
        return 'system-xi-cortexm4-sfp.ads'

    @property
    def full_system_ads(self):
        return 'system-xi-cortexm4-full.ads'

    def __init__(self):
        super(CortexMTarget, self).__init__(
            mem_routines=True,
            small_mem=True)


class LM3S(CortexMTarget):
    @property
    def name(self):
        return 'lm3s'

    @property
    def loaders(self):
        return ('ROM', 'RAM', 'USER')

    @property
    def has_single_precision_fpu(self):
        return False

    @property
    def has_fpu(self):
        # Still add floating point attributes
        return True

    @property
    def compiler_switches(self):
        # The required compiler switches
        return ('-mlittle-endian', '-mthumb', '-msoft-float',
                '-mcpu=cortex-m3')

    @property
    def readme_file(self):
        return 'arm/lm3s/README'

    @property
    def sfp_system_ads(self):
        return None

    @property
    def full_system_ads(self):
        return None

    def __init__(self):
        super(LM3S, self).__init__()

        self.add_linker_script('arm/lm3s/lm3s-rom.ld', 'ROM')
        self.add_linker_script('arm/lm3s/lm3s-ram.ld', 'RAM')
        self.add_sources('crt0', [
            'arm/lm3s/start-rom.S',
            'arm/lm3s/start-ram.S',
            'arm/lm3s/setup_pll.adb',
            'arm/lm3s/setup_pll.ads',
            'src/s-textio__lm3s.adb'])


class SamCommonBSP(BSP):
    @property
    def name(self):
        return 'sam'

    @property
    def parent(self):
        return CortexMArch

    @property
    def loaders(self):
        return ('ROM', 'SAMBA', 'USER')

    def __init__(self):
        super(SamCommonBSP, self).__init__()

        self.add_linker_script('arm/sam/common-SAMBA.ld', loader='SAMBA')
        self.add_linker_script('arm/sam/common-ROM.ld', loader='ROM')

        self.add_sources('crt0', [
            'arm/sam/s-sam4s.ads',
            'arm/sam/start-rom.S',
            'arm/sam/start-ram.S',
            'arm/sam/setup_pll.ads'])
        self.add_sources('gnarl', [
            'src/s-bbpara__sam4s.ads'])


class Sam(CortexMTarget):
    @property
    def name(self):
        return self.board

    @property
    def parent(self):
        return SamCommonBSP

    @property
    def has_single_precision_fpu(self):
        if self.board == 'sam4s':
            return False
        else:
            return True

    @property
    def full_system_ads(self):
        # No runtime full
        return None

    @property
    def compiler_switches(self):
        base = ('-mlittle-endian', '-mthumb', '-mcpu=cortex-m4')

        if not self.has_single_precision_fpu:
            return base
        else:
            return base + ('-mhard-float', '-mfpu=fpv4-sp-d16', )

    def __init__(self, board):
        assert board in ('sam4s', 'samg55'), "Unexpected SAM board %s" % board
        self.board = board
        super(Sam, self).__init__()

        self.add_linker_script(
            'arm/sam/%s/memory-map.ld' % self.name,
            loader=('SAMBA', 'ROM'))
        self.add_sources('crt0', [
            'arm/sam/%s/board_config.ads' % self.name,
            'arm/sam/%s/setup_pll.adb' % self.name,
            'arm/sam/%s/svd/i-sam.ads' % self.name,
            'arm/sam/%s/svd/i-sam-efc.ads' % self.name,
            'arm/sam/%s/svd/i-sam-pmc.ads' % self.name,
            'arm/sam/%s/svd/i-sam-sysc.ads' % self.name,
            'src/s-textio__sam4s.adb'])
        # FIXME: s-textio.adb is invalid for the g55

        # ravenscar support
        self.add_sources('gnarl', [
            'arm/sam/%s/svd/handler.S' % self.name,
            'arm/sam/%s/s-bbbopa.ads' % self.name,
            'arm/sam/%s/s-bbmcpa.ads' % self.name,
            'arm/sam/%s/svd/a-intnam.ads' % self.name])


class SmartFusion2(CortexMTarget):
    @property
    def name(self):
        return 'smartfusion2'

    @property
    def loaders(self):
        return ('ROM', 'USER')

    @property
    def compiler_switches(self):
        # The required compiler switches
        return ('-mlittle-endian', '-mthumb', '-msoft-float',
                '-mcpu=cortex-m3')

    @property
    def has_single_precision_fpu(self):
        return False

    @property
    def has_fpu(self):
        # Still add floating point attributes
        return True

    @property
    def zfp_system_ads(self):
        # no zfp rts
        return None

    @property
    def full_system_ads(self):
        # no ravenscar-full rts
        return None

    def __init__(self):
        super(SmartFusion2, self).__init__()

        self.add_linker_script('arm/smartfusion2/common-ROM.ld', loader='ROM')
        self.add_linker_script('arm/smartfusion2/memory-map.ld', loader='ROM')

        self.add_sources('crt0', [
            'arm/smartfusion2/start-rom.S',
            'arm/smartfusion2/setup_pll.adb',
            'arm/smartfusion2/setup_pll.ads',
            'arm/smartfusion2/s-sf2.ads',
            'arm/smartfusion2/s-sf2.adb',
            'arm/smartfusion2/s-sf2uar.ads',
            'arm/smartfusion2/s-sf2uar.adb',
            'arm/smartfusion2/svd/i-sf2.ads',
            'arm/smartfusion2/svd/i-sf2-system_registers.ads',
            'arm/smartfusion2/svd/i-sf2-mmuart.ads',
            'arm/smartfusion2/svd/i-sf2-gpio.ads',
            'arm/smartfusion2/s-textio.adb'])
        self.add_sources('gnarl', [
            'arm/smartfusion2/s-sf2gpi.ads',
            'arm/smartfusion2/s-sf2gpi.adb',
            'arm/smartfusion2/svd/handler.S',
            'arm/smartfusion2/svd/a-intnam.ads',
            'src/s-bbpara__smartfusion2.ads'])


class Stm32CommonBSP(BSP):
    """Holds sources common to all stm32 boards"""
    @property
    def name(self):
        return 'stm32'

    @property
    def parent(self):
        return CortexMArch

    @property
    def loaders(self):
        return ('ROM', 'RAM', 'USER')

    @property
    def readme_file(self):
        return 'arm/stm32/README'

    def __init__(self):
        super(Stm32CommonBSP, self).__init__()


class Stm32(CortexMTarget):
    """Generic handling of stm32 boards"""
    @property
    def name(self):
        return self.board

    @property
    def parent(self):
        return Stm32CommonBSP

    @property
    def use_semihosting_io(self):
        if self.board == 'stm32f103xx' or self.board.startswith('stm32f0'):
            return False
        return True

    @property
    def has_double_precision_fpu(self):
        if self.mcu == 'stm32f7x9':
            return True
        else:
            return False

    @property
    def cortex(self):
        if self.mcu.startswith('stm32f4'):
            return 'cortex-m4'
        elif self.mcu.startswith('stm32f7'):
            return 'cortex-m7'
        elif self.mcu.startswith('stm32f1') or self.mcu.startswith('stm32f3'):
            return 'cortex-m3'
        elif self.mcu.startswith('stm32f0'):
            return 'cortex-m0'
        else:
            assert False, "Unexpected MCU %s" % self.mcu

    @property
    def fpu(self):
        if self.cortex == 'cortex-m4':
            return 'fpv4-sp-d16'
        elif self.cortex == 'cortex-m0' or self.cortex == 'cortex-m3':
            return ''
        elif not self.has_double_precision_fpu:
            return 'fpv5-sp-d16'
        else:
            return 'fpv5-d16'

    @property
    def compiler_switches(self):
        # The required compiler switches
        s = ('-mlittle-endian', '-mcpu=%s' % self.cortex, '-mthumb')
        if self.fpu != '':
            s = s + ('-mfpu=%s' % self.fpu, '-mhard-float')
        return s


    def __init__(self, board):
        self.board = board
        if self.board == 'stm32f4':
            self.mcu = 'stm32f40x'
        elif self.board == 'stm32f429disco':
            self.mcu = 'stm32f429x'
        elif self.board == 'openmv2':
            self.mcu = 'stm32f429x'
        elif self.board == 'stm32f469disco':
            self.mcu = 'stm32f469x'
        elif self.board == 'stm32f746disco':
            self.mcu = 'stm32f7x'
        elif self.board == 'stm32756geval':
            self.mcu = 'stm32f7x'
        elif self.board == 'stm32f769disco':
            self.mcu = 'stm32f7x9'
        elif self.board == 'stm32nucleo_f303re':
            self.mcu = 'stm32f303xe'
        elif self.board == 'stm32f103xx':
            self.mcu = 'stm32f103xx'
        elif self.board == 'stm32nucleo_f072rb':
            self.mcu = 'stm32f072x'
        elif self.board == 'stm32f0disco':
            self.mcu = 'stm32f051x8'
        elif self.board == 'stm32f030c8_breakout':
            self.mcu = 'stm32f030x8'
        else:
            assert False, "Unknown stm32 board: %s" % self.board

        super(Stm32, self).__init__()

        if self.mcu.startswith('stm32f0'):
            self.add_linker_script('arm/stm32/%s/common-ROM.ld' % self.mcu, loader='ROM')
            self.add_sources('crt0', [
                'src/s-bbpara__stm32f0.ads',
                'arm/stm32/%s/start-rom.S' % self.mcu,
                'arm/stm32/%s/s-stm32.ads' % self.mcu,
                'arm/stm32/%s/start-common.S' % self.mcu,
                'arm/stm32/%s/setup_pll.adb' % self.mcu,
                'arm/stm32/%s/setup_pll.ads' % self.mcu,
                'arm/stm32/%s/s-bbbopa.ads' % self.mcu,
                'arm/stm32/%s/s-bbmcpa.ads' % self.mcu,
                'arm/stm32/%s/s-bbmcpa.adb' % self.mcu,
                'arm/stm32/%s/svd/handler.S' % self.mcu,
                'arm/stm32/%s/svd/i-stm32.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-flash.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-gpio.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-pwr.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-rcc.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-syscfg.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-usart.ads' % self.mcu])
        elif self.mcu.startswith('stm32f1'):
            self.add_linker_script('arm/stm32/%s/common-ROM.ld' % self.mcu, loader='ROM')
            self.add_sources('crt0', [
                'src/s-bbpara__stm32f1.ads',
                'src/s-textio__itm.adb',
                'src/i-arm_itm.ads',
                'src/i-arm_itm.adb',
                'arm/stm32/%s/svd/handler.S' % self.mcu,
                'arm/stm32/%s/start-rom.S' % self.mcu,
                'arm/stm32/%s/s-stm32.ads' % self.mcu,
                'arm/stm32/%s/start-common.S' % self.mcu,
                'arm/stm32/%s/setup_pll.adb' % self.mcu,
                'arm/stm32/%s/setup_pll.ads' % self.mcu,
                'arm/stm32/%s/s-bbbopa.ads' % self.mcu,
                'arm/stm32/%s/s-bbmcpa.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-flash.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-gpio.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-rcc.ads' % self.mcu])
        elif self.mcu.startswith('stm32f3'):
            self.add_linker_script('arm/stm32/common-ROM.ld', loader='ROM')
            self.add_sources('crt0', [
                'src/s-bbpara__stm32f3.ads',
                'arm/stm32/s-stm32.ads',
                'arm/stm32/start-rom.S',
                'arm/stm32/%s/start-common.S' % self.mcu,
                'arm/stm32/%s/setup_pll.adb' % self.mcu,
                'arm/stm32/%s/setup_pll.ads' % self.mcu,
                'arm/stm32/%s/s-bbbopa.ads' % self.mcu,
                'arm/stm32/%s/s-bbmcpa.ads' % self.mcu,
                'arm/stm32/%s/s-bbmcpa.adb' % self.mcu,
                'arm/stm32/%s/svd/i-stm32.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-flash.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-gpio.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-pwr.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-rcc.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-syscfg.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-usart.ads' % self.mcu])
        else:
            self.add_linker_script('arm/stm32/common-RAM.ld', loader='RAM')
            self.add_linker_script('arm/stm32/common-ROM.ld', loader='ROM')
            self.add_sources('crt0', [
                'src/s-bbpara__stm32f4.ads',
                'arm/stm32/s-stm32.ads',
                'arm/stm32/start-rom.S',
                'arm/stm32/start-ram.S',
                'arm/stm32/start-common.S',
                'arm/stm32/setup_pll.adb',
                'arm/stm32/setup_pll.ads',
                'arm/stm32/%s/svd/handler.S' % self.mcu,
                'arm/stm32/%s/s-bbbopa.ads' % self.mcu,
                'arm/stm32/%s/s-bbmcpa.ads' % self.mcu,
                'arm/stm32/%s/s-bbmcpa.adb' % self.mcu,
                'arm/stm32/%s/svd/i-stm32.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-flash.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-gpio.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-pwr.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-rcc.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-syscfg.ads' % self.mcu,
                'arm/stm32/%s/svd/i-stm32-usart.ads' % self.mcu])

        if self.board == 'stm32f4':
            self.add_sources('crt0', [
                'arm/stm32/stm32f40x/s-stm32.adb'])
        elif self.board == 'stm32f429disco':
            self.add_sources('crt0', [
                'arm/stm32/stm32f429x/s-stm32.adb'])
        elif self.board == 'openmv2':
            self.add_sources('crt0', [
                'arm/stm32/stm32f429x/s-stm32.adb'])
            self.update_pair(
                's-bbbopa.ads', 'arm/stm32/%s/s-bbbopa-openmv2.ads' % self.mcu)
        elif self.board == 'stm32f469disco':
            self.add_sources('crt0', [
                'arm/stm32/stm32f429x/s-stm32.adb'])
        elif self.board == 'stm32f746disco':
            self.add_sources('crt0', [
                'arm/stm32/stm32f7x/s-stm32.adb'])
        elif self.board == 'stm32756geval':
            self.add_sources('crt0', [
                'arm/stm32/stm32f7x/s-stm32.adb'])
            self.update_pair(
                's-bbbopa.ads',
                'arm/stm32/%s/s-bbbopa-stm32756geval.ads' % self.mcu)
        elif self.board == 'stm32f769disco':
            self.add_sources('crt0', [
                'arm/stm32/stm32f7x/s-stm32.adb'])
        elif self.board == 'stm32nucleo_f303re':
            self.add_sources('crt0', [
                'src/s-stm32__f303xe.adb'])
        elif self.board == 'stm32f103xx':
            self.add_sources('crt0', [
                'src/s-stm32__f103xx.adb'])
        elif self.board == 'stm32nucleo_f072rb':
            self.add_sources('crt0', [
                'src/s-stm32__f072x.adb'])
        elif self.board == 'stm32f0disco':
            self.add_sources('crt0', [
                'src/s-textio__stm32f0.adb',
                'src/s-stm32__f051.adb'])
        elif self.board == 'stm32f030c8_breakout':
            self.add_sources('crt0', [
                'src/s-stm32__f030.adb'])

        # ravenscar support
        self.add_sources('gnarl', [
            'arm/stm32/%s/svd/a-intnam.ads' % self.mcu])

        self.add_linker_script('arm/stm32/%s/memory-map.ld' % self.mcu,
                               loader=('RAM', 'ROM'))

class Efm32CommonBSP(BSP):
    """Holds sources common to all efm32 boards"""
    @property
    def name(self):
        return 'efm32'

    @property
    def parent(self):
        return CortexMArch

    @property
    def loaders(self):
        return ('ROM', 'RAM', 'USER')

    @property
    def readme_file(self):
        return 'arm/efm32/README'

    def __init__(self):
        super(Efm32CommonBSP, self).__init__()

        self.add_linker_script('arm/efm32/common-ROM.ld', loader='ROM')

        self.add_sources('crt0', [
            'src/s-bbpara__efm32.ads',
            'arm/efm32/s-efm32.ads',
            'arm/efm32/start-rom.S',
            'arm/efm32/start-common.S'])


class Efm32(CortexMTarget):
    """Generic handling of EFM32 CPUs"""
    @property
    def name(self):
        return self.board

    @property
    def parent(self):
        return Efm32CommonBSP

    @property
    def use_semihosting_io(self):
        return False

    @property
    def has_double_precision_fpu(self):
        return False

    @property
    def cortex(self):
        if self.mcu.startswith('efm32zg') or self.mcu.startswith('efm32hg'):
            return 'cortex-m0'
        elif self.mcu.startswith('efm32wg'):
            return 'cortex-m4'
        else:
            return 'cortex-m3'

    @property
    def compiler_switches(self):
        base = ('-mlittle-endian', '-mthumb')
        if self.cortex == 'cortex-m0':
            mcu = ('-mcpu=cortex-m0', )
        elif self.cortex == 'cortex-m3':
            mcu = ('-mcpu=cortex-m3', )
        elif self.cortex == 'cortex-m4':
            mcu = ('-mcpu=cortex-m4', '-mfloat=hard', )
        return base + mcu

    def __init__(self, board):
        self.board = board
        self.mcu = board

        super(Efm32, self).__init__()

        self.add_linker_script('arm/efm32/%s/memory-map.ld' % self.mcu,
                               loader=('ROM'))
        # startup code
        self.add_sources('crt0', [
            'arm/efm32/%s/s-bbbopa.ads' % self.mcu,
            'arm/efm32/%s/s-bbmcpa.ads' % self.mcu,
            'src/s-textio__efm32.adb'])

        # ravenscar support
        self.add_sources('gnarl', [
            'arm/efm32/%s/handler.S' % self.mcu,
            'arm/efm32/%s/a-intnam.ads' % self.mcu])
