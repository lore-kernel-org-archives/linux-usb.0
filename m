Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F443D9029
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175216; cv=none; b=ubMmiYF5vB6n3fzCRJlmxYkfdSH8+LDweeD1QdvU+i9EykwjSkD40O8Q7Pm3aVmYbFG/MJuNDrOj91PzGXfYgpZs5VG+6f5mJdcdPhHn1PHbEJhCwjqzAVgEICmBokR+mb9+CYJ+wWUzSPscCDHi1ssujwqn7IHtiJExj/344cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175216; c=relaxed/simple;
	bh=Vub1gplhxHp6HMQHqj0tPcR/s9Q9XMyXnwS8v5xzQ2M=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=W9PJs6/FzSD+1rwZjbwnqkP0q5rJAD8rhbmmsuGUNbZ0pRXSrTc3Swr8LowWhb9Z4o3TdTYFyemDO0wxeWs5uX0E3tQT+aZNHZnE65prd/VqDz/FM6paUWlNGUs0JLlf2BKK95LOrxArIFVnpvI33s/UsQIXvcduKZ7TWFSukXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S91xn15P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S91xn15P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5076C2BCC7
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790175215;
	bh=Vub1gplhxHp6HMQHqj0tPcR/s9Q9XMyXnwS8v5xzQ2M=;
	h=From:To:Subject:Date:From;
	b=S91xn15PAviTilO+Pvusm8RBoaNeUcGsrpuL8NTqgq3+mpx+wG8IzpABy7YYr+3tg
	 Z3jYyhi7HQA7ux9FnD2cx3ZBuUnIUMnBe7/zmpyhfaBaFi0vbEN9ZIe9rBW0xfSuiQ
	 WKwSkNTVFaRq5APRXWgqMVLV3FCbfkUBlLgv69gpM2BNk7l5uRnSSOkz+cK2CmUTT1
	 Cfpp6s8C+x6jL7z987CdA7wKpGU3FCr/5OsPIf+2FgPfq0Ec22uchcaTqq0i5mYSTC
	 yK5btq6tSWG8hWlmLEx1xEKSKQV/AiK8KHqliCn4PPYNISHwlKUf+AHXXwibDVZZ19
	 zs0QpnQXYIYpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A32C5C41612; Wed, 23 Sep 2026 14:53:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222050] New: Periodic ~1s click/tick on JMTek USBFH11
 (0c76:1720) USB audio playback under Linux, not present on Windows with same
 hardware
Date: Wed, 23 Sep 2026 14:53:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmoradi5950@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222050-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222050

            Bug ID: 222050
           Summary: Periodic ~1s click/tick on JMTek USBFH11 (0c76:1720)
                    USB audio playback under Linux, not present on Windows
                    with same hardware
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mmoradi5950@gmail.com
        Regression: No

Product: Drivers
Component: USB

## Summary
Periodic ~1s click/tick on JMTek USBFH11 (0c76:1720) USB audio playback und=
er
Linux, not present on Windows with same hardware

## Regression
Not a regression as far as I can tell =E2=80=94 I have never gotten clean p=
layback from
this headset on Linux, on any kernel I've tried (see kernel list below). I
don't have an older "known good" Linux kernel to bisect against.

## Description
When playing any audio through this USB headset for more than ~3 seconds, a
distinct tick/pop/electrical-discharge-like sound occurs roughly once per
second, for as long as playback continues. This happens consistently across
multiple distros and kernels, through both raw ALSA and PipeWire.

The same headset, on the same physical hardware, does **not** produce the t=
ick
under:
- Native Windows, dual-booted on the same machine
- Native Windows on a second, different laptop

It **does** still produce the tick under:
- Windows running in a VirtualBox VM with USB passthrough on the Linux host
(i.e. it only goes away with *direct/native* Windows USB access, not just
"Windows the OS")

## Steps to Reproduce
1. Plug in the USBFH11 headset (0c76:1720)
2. Play any audio for more than ~3 seconds
3. Tick/click is audible approximately once per second, continuing indefini=
tely
during playback

## Environment
- Kernel: `Linux MmdrzaArch 7.3.0-rc4 #1 SMP PREEMPT_DYNAMIC Wed Sep 23
02:48:20 +0330 2026 x86_64 GNU/Linux`
- Also reproduced on: Arch (regular, LTS, RT, Zen kernels), CachyOS, Fedora,
Ubuntu LTS
- Motherboard: ASRock H61M-VG3 (chipset only provides EHCI, no xHCI)
- USB ID: 0c76:1720 (JMTek, LLC. USBFH11 / "Solid State System Co.,Ltd.
USBFH11")

## Already ruled out
Note on this list: most of these tests were suggested by an AI or found via=
 web
search while I was trying to narrow this down myself over the past several
days, not things I independently knew were the right diagnostic steps. I'm
including them for completeness/to save maintainer time, but I can't person=
ally
vouch for whether each one was actually a meaningful or necessary test vers=
us a
plausible-sounding guess =E2=80=94 take them as "tried, no effect observed"=
 rather than
"confirmed irrelevant by someone who understands the internals."

- **SMI storm**: `rdmsr -p 0 0x34 -d` polled once per second during playbac=
k =E2=80=94
count stayed flat (no SMI accumulation)
- **C-state wakeup latency**: tested with `cpupower idle-set -D 1` (disabli=
ng
deep C-states) =E2=80=94 tick persists
- **PipeWire vs raw ALSA**: reproduces identically via `speaker-test` direc=
tly
against ALSA, not just through PipeWire
- **Different USB ports** (tried multiple physical ports) =E2=80=94 no chan=
ge
- **Different buffer sizes** =E2=80=94 no change
- **Different kernels** =E2=80=94 reproduces on Arch (regular/LTS/RT/Zen), =
CachyOS,
Fedora, Ubuntu LTS, including 7.3.0-rc4
- **Shared USB controller devices**: unbound a USB wifi dongle (`rtw88_8821=
cu`)
sharing the same EHCI hub/controller as the headset =E2=80=94 no change
- **Device's own HID subinterface**: unbound the headset's own HID control
interface (volume/mute buttons) =E2=80=94 no change
- **USB capture at connect time**: captured USB traffic (usbmon/Wireshark)
around device connect/reinit =E2=80=94 the only unusual activity is a one-t=
ime ~0.45s
burst of altsetting-probing and volume-calibration control transfers
immediately after connect, which does not recur during steady-state playback
and does not correlate with the ongoing tick
- **dmesg during playback**: `dmesg -w` while the tick is actively occurring
shows nothing =E2=80=94 no reset, disconnect, error, or warning lines logge=
d at the
moments the tick occurs

## USB Descriptor (lsusb -v -d 0c76:1720)
```
Bus 002 Device 021: ID 0c76:1720 JMTek, LLC. USBFH11
Couldn't open device, some information will be missing
Negotiated speed: Full Speed (12Mbps)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 [unknown]
  bDeviceSubClass         0 [unknown]
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x0c76 JMTek, LLC.
  idProduct          0x1720 USBFH11
  bcdDevice            1.00
  iManufacturer           1 Solid State System Co.,Ltd.
  iProduct                2 USBFH11
  iSerial                 0
  bNumConfigurations      1
   Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0137
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              0
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x004e
        bInCollection           2
        baInterfaceNr(0)        1
        baInterfaceNr(1)        2
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0000
        iChannelNames           0
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            17
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID              49
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            18
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          2
        bSourceID              33
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      5 (SELECTOR_UNIT)
        bUnitID                33
        bNrInPins               1
        baSourceID(0)          50
        iSelector               0
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                49
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x01
          Mute Control
        bmaControls(1)       0x02
          Volume Control
        bmaControls(2)       0x02
          Volume Control
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                50
        bSourceID               2
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        bmaControls(1)       0x00
        iFeature                0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           1
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0001
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           1
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x0120  1x 288 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0001
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          18
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0060  1x 96 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          18
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0090  1x 144 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 [unknown]
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.00
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      62
          Report Descriptors:
            ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              32
```

## ALSA Stream Info (during active playback)
```
Solid State System Co.,Ltd. USBFH11 at usb-0000:00:1d.0-1.2, full speed : U=
SB
Audio

Playback:
  Status: Running
    Interface =3D 1
    Altset =3D 2
    Packet Size =3D 288
    Momentary freq =3D 48000 Hz (0x30.0000)
  Interface 1
    Altset 1
    Format: S16_LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (SYNC)
    Rates: 48000
    Bits: 16
    Channel map: FL FR
  Interface 1
    Altset 2
    Format: S24_3LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (SYNC)
    Rates: 48000
    Bits: 24
    Channel map: FL FR

Capture:
  Status: Stop
  Interface 2
    Altset 1
    Format: S16_LE
    Channels: 1
    Endpoint: 0x82 (2 IN) (ASYNC)
    Rates: 48000
    Bits: 16
    Channel map: MONO
  Interface 2
    Altset 2
    Format: S24_3LE
    Channels: 1
    Endpoint: 0x82 (2 IN) (ASYNC)
    Rates: 48000
    Bits: 24
    Channel map: MONO
```

## dmesg (device connect/enumeration; note this is NOT captured during an
active tick =E2=80=94 see "Already ruled out" for confirmation that dmesg -=
w during
playback shows nothing)
```
[12966.896244] usb 2-1.2: USB disconnect, device number 21
[12968.097034] usb 2-1.2: new full-speed USB device number 22 using ehci-pci
[12968.173259] usb 2-1.2: New USB device found, idVendor=3D0c76, idProduct=
=3D1720,
bcdDevice=3D 1.00
[12968.174755] usb 2-1.2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[12968.174763] usb 2-1.2: Product: USBFH11
[12968.174766] usb 2-1.2: Manufacturer: Solid State System Co.,Ltd.
[12968.190151] input: Solid State System Co.,Ltd. USBFH11 as
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.3/0003:0C76:1720.00=
16/input/input45
[12968.241409] hid-generic 0003:0C76:1720.0016: input,hidraw5: USB HID v1.00
Device [Solid State System Co.,Ltd. USBFH11] on usb-0000:00:1d.0-1.2/input3
```

## Additional context
Host controller is EHCI only (ASRock H61M-VG3 chipset has no xHCI). Histori=
cal
kernel bugs (e.g. bugzilla #6709, #9230) describe a similar class of period=
ic
clicking on USB audio devices tied to isochronous transfer scheduling/timing
under EHCI, and a 2013 kernel commit note describes the EHCI periodic
scheduler's split-transaction handling as fragile enough that a fix for one=
 bug
there previously caused audible playback regressions on other devices. I'm =
not
asserting this is the same root cause =E2=80=94 just flagging it as a possi=
bly related
historical pattern in case it's useful context.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
