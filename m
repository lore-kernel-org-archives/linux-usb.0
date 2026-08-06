Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA3415F13
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052920; cv=pass; b=V5MfKlMyoBWL4jsOnCrHJe52j2/VTwo+L7wrGkNkWxwHvB5K+4EQ1nrytWz1b40wsZD/n/Vnrnn7wYNO8ZUhDZk2oUUa+ng1hq4hCHwgG+xbxq9FTWXGu3waHi4FTh1g9HvUSdxNdkIew3UZEPSf+3N4AWjlbBCqT5heQsVgMTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052920; c=relaxed/simple;
	bh=/+ZXhUEUi/T24MCA1ODtEYHf4Og3HJbPbIox/nnKYRg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W0t80B/fz2wz/WM7HPeyugHMSkreTF0qzA9AnDy8ftjfje4fEo3wPjdWAXk3wsxJA60yI4kGAFHuI0SFcsmw6xyHt3djRCFy8Q+rGAzZ81oYuli4jNQzKwkhiCMul6T+i+A3RkUj3wj30w7cduf/bLQ2sIHOoCSYdPoSORYFA8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvpzauLk; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvpzauLk"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aec6360133so2332482e87.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 14:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786052917; cv=none;
        d=google.com; s=arc-20260327;
        b=kwvol0BSX/4/j+Cwt/dp2a01RX31xn5OooTvxG9eFh4WDLKTD30y8jNxqur7KQQrnc
         o4yhq99oZUjYps50yuWAXaVFgFlNW/bJVVjew8ZYgDNrugTKFa68HxWh1LKpVhhWip1U
         q2GwZ9tMnHwOwdxBs6f0ylVsBbUQDB1XVQhIjglkXz/+piWT4RZchwI3rTNQ3gb5kKqO
         EqfbSAmQI8dFqiExy2om0RIJvhrhMtx+SqIcFd/puQockbXNOaexLxdh7vqAt6t8/BmH
         YYn7/at8iiw6vyPOisGiAgDqZEwIssR5DuzByjONJ0QI5Oq6cqenfd8+QFt4tHpdQOC0
         LHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pZD21qUE8ry6rb8cU5ZTkhkvQlzif+7qFw9V0q3/4bM=;
        fh=j8euBZQFl2yMzTv3IDFgac+NAJJHHzBYVCJqT+/vl6c=;
        b=Vty4DJ1IGubQj4/5qvqXNo4s48lfuA182Xd7bvAp4/vKfa0JthzsSqgG5SPZlI619M
         QEOHk1Jq88QfWgnZPcC2DAyAWNSbfWbq1a4Y9Zuv5NoesmiaTpkdv1w6ia9tk2rVuJ/J
         0l+B7Vpi0ki424M1v7qG2C2ZHggqTw/e6fWGytBFeQqq/xmFBQ30A+qNSW5D0LankdhU
         iCWO5QJDHDF/k70L6K4PWwobJklhIPxwM3Gu5hN4rU6/frIrtc3f/H/0WWtLhxi5Jsi/
         wx3sJF7zdEONv49Nv7rmS8Q4J9puu/ar5siG+kQ71JOvVhgNrSpjiJzFmMjvQgwGBDs2
         NXrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786052917; x=1786657717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZD21qUE8ry6rb8cU5ZTkhkvQlzif+7qFw9V0q3/4bM=;
        b=jvpzauLkFYwLFglq4laZPs/2ZY+N2u0HcuVSZaVW4lT2n0EJnzFGuOSODhPzvBTKoT
         oJcRp4mGnasznuKtLRqV54E5EyxAxlPozimL1ZBQLnHF7PM8jpg8ZHhJFC8I0a/J+gtf
         30oa18FF3lMsKyodfl/be8uunGVhO00UWf6q2tjCF9wiYOzds9udvWeTAff1NHIkT2GI
         iR+52Q06EgpNSe+2E8yIit/qroM6amMuJNuLZ4T81r2ZfBjIiLOgSX9rbajSjYwgk3G1
         PiI9e4B8DMJijVvf/tnMGZC+2tLIKYF+Bw8wqMF3KM8UYCsJbUC/LH4f4h15O+CCoxj5
         SAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786052917; x=1786657717;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pZD21qUE8ry6rb8cU5ZTkhkvQlzif+7qFw9V0q3/4bM=;
        b=L96NpbFpiFbsm7eK74iH/U+3+LwafY38vdjssU7mEId8FcL0Ks3thncaQC9++p6j06
         3TGIgjXw1rwOlQDVhmThULmEXuON7VYPVbyv2BeSKbGmhKhxfYVTSdQUWdyiNJoi+08V
         59TzQ8P473/guQ6nkAfESa8GQUEGF0oLW5cruIz7a5QP4Nfk+kQcT9McysxI8sWOfdfi
         BI8kzDC12deFe429h4hIiG56oEBE7lrBn4pypgtXbloZPcFEn21HvAdIxYjtATc+xHWk
         vx6LJQfDVVQUBxIxixbjWvJ5A81+PI7fyFtxHuA6phLwt1phrebg6zuHRUwseWCty+NT
         +skg==
X-Gm-Message-State: AOJu0YwE56x07EUGFoD62cbksnE4xTWNLWPvYGILXEZjfJjHYo2e7Yy5
	W+sptKuxJA+1ULA3j+vQAmF36DZucZTUY0dAmquIKFEud4oiaYieXm9LxMnFgHNkb3QiomkQDNd
	AIha3LpgcUKj34WgFZW8pMH7pSHdmX4R3OCHvDtQodA==
X-Gm-Gg: AR+sD10fEoEKmch2NEmjDwYVjyEflwBv9btZwkfMpr5tX+EmUqo43kFE1erWnkO5IqQ
	dPoV5bKulMfLVCo7KQ42CY/C0Pk/Luxm3pck6LP9XbhBP4KqRETPMw8z4zPXPaZUuZVkC0r/gGI
	OM8HUtOTankwl44Ua1rhQ9Fi6AVtlr+AjQ23YEZqpv9WF9zGuxz23A7OKqoXL+VMKBwpI50u5/P
	lty3TnuEr0uL4QUv/qNnBOUIa0FPQpviwApswOCmfrZL/n3kY7zgeiu7826GSgXRabhV5xalCg7
	//xSNiGuapvClyFQs2yYW9v+VMoqKGtyNKlmKPJBaSM=
X-Received: by 2002:a05:6512:1381:b0:5b1:5ccf:5268 with SMTP id
 2adb3069b0e04-5b2f4b7aff1mr2301263e87.1.1786052916292; Thu, 06 Aug 2026
 14:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: David GUENAULT <david.guenault@gmail.com>
Date: Thu, 6 Aug 2026 23:48:24 +0200
X-Gm-Features: AUfX_my7rKkJbmIAdK1pBhnYLEIQXBmzTQDBpe4nuw3mJT70Np9xMFouXE1wpio
Message-ID: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>
Subject: thunderbolt: PCIe tunnel creation fails for USB4 eGPU dock on Titan
 Ridge host
To: Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

PCIe tunneling never succeeds between an Intel Titan Ridge 2C host router
and a USB4 (Thunderbolt 5) eGPU dock, although the Thunderbolt link itself
comes up fully bonded at 40 Gb/s and both routers enumerate cleanly.
tb_tunnel_pci() fails silently -- the only message is "PCIe tunnel creation
failed", with no path/credit/activation diagnostics even with full dyndbg.

=======================================================================
HARDWARE
=======================================================================
Host    : Intel NUC10i7FNH (Comet Lake, i7-10710U)
          BIOS FNCML357.0067.2026.0429.1614 (04/29/2026)
Host TBT: JHL7540 Titan Ridge 2C 2018
          Root port      00:1c.0  [8086:02bc]
          Bridges        01:00.0, 02:00.0, 02:01.0, 02:02.0  [8086:15e7]
          NHI            03:00.0  [8086:15e8]
          USB ctrl       39:00.0  [8086:15e9]
          Host router config space vendor/device = 0x15e78086
          => tb_switch_is_titan_ridge() == true
          NVM 42.0, generation 3

Device  : Minisforum DEG2 eGPU dock (OCuLink/TBT5, switch set to TBT)
          Thunderbolt router: "Micro Computer (HK) Tech. Ltd. TBGAA"
          vendor=0x41f device=0xd002
          Router config space: USB4 Switch 8087:5786 (Revision 133, TB
Version 64)
          NVM 62.42, generation 4 (USB4)
          GPU inside the dock: NVIDIA GTX 1060 (dock reports GPU
present via LED)

=======================================================================
SOFTWARE
=======================================================================
Ubuntu 24.04.4 LTS

Reproduced identically, byte-for-byte same failure, on BOTH:
  - 7.0.0-28-generic #28~24.04.1-Ubuntu   (distro kernel, based on 7.0.12)
  - 7.1.5-070105-generic                  (vanilla mainline v7.1.5 build from
                                           kernel.ubuntu.com/mainline, no
                                           distro patches)

Cmdline: pcie_ports=native pcie_aspm.policy=performance
         thunderbolt.start_icm=1 thunderbolt.host_reset=0

Connection manager: software CM. The driver enumerates all 23 adapters of
the remote router itself, so ICM is not running. thunderbolt.start_icm=1
does NOT start it (BIOS "Ignore Thunderbolt Option ROM" is unchecked, so
the option ROM is loaded).

=======================================================================
WHAT WORKS
=======================================================================
- ACPI _OSC: OS now controls [PCIeHotplug SHPCHotplug PME
PCIeCapability LTR DPC]
- pciehp armed on the tunnel bridge:
      pcieport 0000:02:01.0: pciehp: Slot #1 ... HotPlug+ Surprise+ LLActRep+
      /sys/bus/pci/slots/1 -> 0000:04:00
- Thunderbolt link fully up and bonded:
      rx/tx 20.0 Gb/s per lane, 2 lanes = 40 Gb/s each direction
      lane adapter error counters: all zero
- Remote router enumerates completely, no errors:
      DROM read, uid 0xf87e040080877eba, all 23 adapters read,
      quirk_usb3_maximum_bandwidth applied, NVM 62.42 read
- Adapters present on both sides:
      host 0-0: port8, port9 = TB_TYPE_PCIE_DOWN (0x100101)
                port5, port6 = DP_HDMI_IN
      dock 0-1: port9  = TB_TYPE_PCIE_UP   (0x100102)
                port10 = TB_TYPE_PCIE_DOWN (to the internal GPU)
                port11/12/19 = DP_HDMI_OUT, port20-23 = USB3
- Host PCIe down adapters are NOT pre-enabled by firmware:
      0-0/port8 cap_id 0x04 (TB_PORT_CAP_ADAP) = 0x2126043a  -> PE (bit31) = 0
      0-0/port9 cap_id 0x04 (TB_PORT_CAP_ADAP) = 0x2126043a  -> PE (bit31) = 0
  so tb_find_pcie_down() should not reject them.
- Expected mapping is satisfied: dock arrives on lane adapter 1,
  tb_phy_port_from_link(1) = 0, Titan Ridge => index 8 => port8 (free
PCIe down).
- BIOS resources reserved behind 02:01.0 are ample for a GTX 1060:
      bus 04-38, I/O 4K, mem 351M, prefetchable 64-bit 544M
      (GTX 1060 needs ~304M: BAR0 16M + BAR1 256M + BAR3 32M)

=======================================================================
WHAT FAILS
=======================================================================
With BIOS Thunderbolt Security Level = "Unique ID" (SL1, sysfs security=user),
boltd authorizes the device, which triggers tb_approve_switch(), and:

    thunderbolt 0-1: new device found, vendor=0x41f device=0xd002
    thunderbolt 0-1: Micro Computer (HK) Tech. Ltd. TBGAA
    thunderbolt 0000:03:00.0: 1: NVM version 62.42
    thunderbolt 0000:03:00.0: PCIe tunnel creation failed

boltctl then reports "authorization error"; /sys/.../0-1/authorized = 0.
02:01.0 stays at PresDet-, no device ever appears on bus 04, no GPU in lspci.

Notably there is NO "PCIe tunnel activation failed, aborting" message, which
suggests the failure happens in tb_tunnel_alloc_pci() rather than in
tb_tunnel_activate().

Full dyndbg was enabled ("module thunderbolt +p", 314 active sites) for all
captures. Nothing is logged between "NVM version 62.42" and the failure.

=======================================================================
ANALYSIS / SUSPICION
=======================================================================
Since the down port is found, free and correctly mapped, the most plausible
remaining failure point is credit allocation in tb_pci_init_credits():

    if (tb_port_use_credit_allocation(port)) {
            credits = sw->max_pcie_credits;
            available = tb_available_credits(port, NULL);
            if (available < credits)
                    return -ENOSPC;      /* silent */
    }

tb_port_use_credit_allocation() is true for USB4 routers, and the dock IS a
USB4 router -- but the path terminates on a Thunderbolt 3 Titan Ridge host.
Adapter credits reported by the dock:
    lane adapters (port1-4): Credits (total/control) 160/2
    PCIe adapters (port9/10): Credits (total/control) 8/0, NFC 0x40800000
    USB3/DP adapters:         Credits (total/control) 8/0

I suspect the USB4 credit-allocation path is applied to a tunnel that
traverses a non-USB4 host router, yielding -ENOSPC. I could not confirm this
without instrumenting the driver; happy to test any patch or add tracing.

=======================================================================
NOTES ON SETTINGS THAT MATTER
=======================================================================
1. With BIOS Security Level = "No Security" (sysfs security=none), the device
   is auto-authorized and tb_approve_switch() is never called, so NO tunnel is
   ever attempted and nothing at all is logged. Switching to SL1 ("Unique ID")
   is what makes the driver actually try. This asymmetry is confusing: with
   security=none plus software CM and no ICM running, nobody creates the
   PCIe tunnel and the device silently looks "authorized" but is unusable.

2. thunderbolt.host_reset=0 measurably improves link behaviour on this TBT3
   host: with the default (host_reset=1) the link never came up at boot and
   required a manual unplug/replug; with host_reset=0 the router is connected
   and bonded at 40 Gb/s directly at boot. The parameter is documented as
   targeting USB4 host routers, yet it clearly affects this Titan Ridge host.

3. Unrelated but worth noting: passing pcie_aspm=off makes
   negotiate_os_control() bail out entirely --
   "_OSC: not requesting OS control; OS requires [ExtendedConfig ASPM
ClockPM MSI]"
   -- which silently drops native PCIe hotplug, so pciehp never binds to the
   Thunderbolt downstream port and no tunnelled device can ever be enumerated.
   pcie_aspm.policy=performance avoids this.

=======================================================================
WORKAROUNDS TRIED WITHOUT SUCCESS
=======================================================================
- thunderbolt.clx=0            (no change; link still dropped at the time)
- thunderbolt.start_icm=1      (ICM does not start; still software CM)
- pci=realloc / assign-busses / nocrs / hpbussize / hpmemsize
  (assign-busses is actively harmful: it shrinks the BIOS reservation
   [bus 04-38] down to [bus 04])
- Cold power cycle (AC unplugged), several cable replug sequences,
  certified TBT3/4 cable, dock's OCuLink/TBT switch verified on TBT.
- Runtime PM: the remote router suspends and then fails to resume
  ("thunderbolt 0-1: runtime resuming timed out"), which prevents tunnel
  creation as well. Worked around with a udev rule setting
  ATTR{power/control}="on" on SUBSYSTEM=="thunderbolt" and on the
  8086:15e7/15e8/15e9 PCI devices.

I can provide full dyndbg captures, debugfs register dumps for any adapter,
and test patches. Thanks!
