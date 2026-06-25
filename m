Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C30A14F70;
	Thu, 25 Jun 2026 02:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782353796; cv=none; b=thQrbLtADb+ErZ0DoYGuTceGYaboXYYyr5veE6KRH4gNEEzvOIDUT+5v43/gDdRSBVNcEMosvyBxK8z52ilmp1In+okyWxhKkhdWCerfYMiTP0hzUBZVqf1+ZUIaY6ao7HFHC4oYGoowaRdhkljVy+1Cu8C1XgU63R4r8/3kDCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782353796; c=relaxed/simple;
	bh=Hg/vL20jxeiH+mhRpoaJHZMLG4BLTHfFBPj81qlZDjg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aRDq+18cISe71Mq6de5jjwi30wVs+w29SRH420zrID9a7vb0BeFknWhCjOxhF5xWLQUdq5i/xwVkntC0vTiOdKAGCQm7oELOHf55o1qWFmht4CANlKNqHVXsAK3lgNsGmCQDloka4YTGnD6XqhxmwSeA6Rkcsg0LfGdqaLFf5ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=ZeYCd/Ga; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="ZeYCd/Ga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=0RNzeWnHZksBrLtluz0vRi0SQOTlCLZnQ
	0CtKGOqzqE=; b=ZeYCd/GaDHrktyZhJlig+okuW0BznkdGOITaZE5O16g/yqcuO
	NxCxA+QNyaDWGHoIl6SZJpo8WoDECpw0j+cu+DAhHgBrq4+72fWQrwZ7hgOiBqLv
	I3Oinpi2FwRXU7MqK/cA2MpdU+SLo50u31MVZS7hqZpQlxPdgkvDmCGR3w=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUKfjzxqaOsMAA--.14046S2;
	Thu, 25 Jun 2026 10:17:04 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
From: Xincheng Zhang <zhangxincheng@ultrarisc.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Xincheng Zhang <zhangxincheng@ultrarisc.com>, cyrozap@gmail.com, 
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, mathias.nyman@intel.com
In-Reply-To: <20260625020421.2e577a94.michal.pecio@gmail.com>
References: <20260623121847.53749028.michal.pecio@gmail.com>
 <20260624070612.337013-1-zhangxincheng@ultrarisc.com>
 <20260625020421.2e577a94.michal.pecio@gmail.com>
Date: Thu, 25 Jun 2026 10:16:29 +0800
Message-Id: <178235378952.3114334.15752812276771065417.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782353789; l=4367;
 i=zhangxincheng@ultrarisc.com; s=20260624; h=from:subject:message-id;
 bh=Hg/vL20jxeiH+mhRpoaJHZMLG4BLTHfFBPj81qlZDjg=;
 b=b9srKfIZaNC0ccgf1R33lKNfJnym9zLcedDq63mt4xXiJ6AXNuTf7cdHGvTKkgl2a+xWuEznY
 h5sM4uK0eUaCLBGarSxvX+4bpZfka+8fYJGHrUtJ10+zzjMsMixya1C
X-Developer-Key: i=zhangxincheng@ultrarisc.com; a=ed25519;
 pk=QKwIEfHqvHrwmpA11qRt63ntQ3+BYBPSEvecshGYdOA=
X-CM-TRANSID:AQAAfwAnYUKfjzxqaOsMAA--.14046S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw47uF4DXrykGFyUGw13twb_yoWrCr1kpF
	WvkF43Kr4vqF1avr9rC34UWFWFvFsFyay5WFn2kr92kan0gry7uFyUJF4rKayaqryxJ34Y
	vrn8J3WxKrn8XaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBVbkUUUUU=
X-CM-SenderInfo: x2kd0wp0lquxxhqjq3powut2xlvfhudrp/1tbiAQAIDGo7VEwABAAOsG

On 2026-06-25 02:04 +0200, Michal Pecio wrote:
> By the way, are you sure that 64GB is the magic number and not 1TB?
> I booted a common AMD64 box with iommu.forcedac=1 and instantly got
> IOMMU faults, but the addresses were truncated to 40 bits, not 36.
> 
> I applied 40 bit DMA mask and my VL805 seems to work. I looked into
> debugfs and many things are mapped close to 1TB, so I wonder if some
> chips are better than others or maybe there are particular workloads
> where VL805 truncates something to 36 bits? I tried a few, including
> bulk, interrupt, isochronous and USB3 bulk streams.
> 
> How was this problem found? Do you have >64GB RAM and no IOMMU?
> Or with IOMMU whose driver allocates mappings above 4GB?

Hi Michal,

Thanks for testing this.

I re-tested this on our side and collected more details. The machine is an
UltraRISC DP1000 riscv64 system with a VIA VL805/806 controller:

  0002:01:00.0 USB controller [0c03]: VIA Technologies, Inc. VL805/806 xHCI USB 3.0 Controller [1106:3483] (rev 01)

The booted kernel was built with xHCI debug enabled and with the VL805
XHCI_NO_64BIT_SUPPORT quirk removed, so the controller was allowed to use
the normal AC64/64-bit DMA path.

This is a no-IOMMU setup, and the command line does not include
iommu.forcedac.

The system has about 64 GB of RAM:

  MemTotal:       65837388 kB

With the 64-bit DMA path enabled, xHCI setup logged DMA addresses above
0x1000000000:

  xhci_hcd 0002:01:00.0: Enabling 64-bit DMA addresses.
  xhci_hcd 0002:01:00.0: // Device context base array address = 0x0x0000001075cef000 (DMA), (____ptrval____) (virt)
  xhci_hcd 0002:01:00.0: First segment DMA is 0x0x0000000108961000
  xhci_hcd 0002:01:00.0: ERST deq = 64'h1075ca7000
  xhci_hcd 0002:01:00.0: Slot 1 output ctx = 0x0x0000001075387000 (dma)
  xhci_hcd 0002:01:00.0: Output Context DMA address = 0x1075387000

Shortly afterwards the controller stopped responding:

  xhci_hcd 0002:01:00.0: Command timeout, USBSTS: 0x00000000
  xhci_hcd 0002:01:00.0: Command timeout
  xhci_hcd 0002:01:00.0: Abort command ring
  xhci_hcd 0002:01:00.0: Abort failed to stop command ring: -110
  xhci_hcd 0002:01:00.0: Host halt failed, -110
  xhci_hcd 0002:01:00.0: xHCI host controller not responding, assume dead
  xhci_hcd 0002:01:00.0: HC died; cleaning up
  xhci_hcd 0002:01:00.0: Timeout while waiting for setup device command

With the 36-bit DMA mask applied earlier, the same controller initialized
and enumerated normally on this machine.

> By the way, are you sure that 64GB is the magic number and not 1TB?
> [...] the addresses were truncated to 40 bits, not 36.

I'm not claiming 64 GB is a hard architectural limit for all VL805/806
parts. On this particular controller (rev 01), the failing addresses
(e.g. 0x1075cef000) are only just above the 64 GiB / 36-bit boundary but
well within 40 bits, and the controller still died. So the effective limit
on this part appears to be lower than the 40 bits you observed.

> I applied 40 bit DMA mask and my VL805 seems to work. [...] so I wonder if
> some chips are better than others [...]

That matches my suspicion - this looks like it may be silicon/revision
dependent. Your part tolerating ~1 TB with a 40-bit mask while mine fails
just above 36 bits is a strong hint that the two chips behave differently.

> How was this problem found? Do you have >64GB RAM and no IOMMU?
> Or with IOMMU whose driver allocates mappings above 4GB?

The former: this box has ~64 GB of RAM and no IOMMU, so the buffers are
simply placed at their real physical addresses, some of which fall above
0x1000000000 (64 GiB). There is no IOMMU and no forcedac involved here.

One practical limitation on my side: this DP1000 only has 64 GB of RAM, so I
cannot generate physical addresses above the 40-bit range at all, and
without an IOMMU I have no way to force higher addresses either. That means
I can't bisect the real upper boundary (37/38/39/40 bits) on this hardware -
the most I can observe is that the failure already happens just above 36
bits.

Given that 36 bits is the only value I can reliably verify fixes the hang on
real hardware here, I'd lean towards keeping it as a conservative default
unless we can establish that a higher mask is safe across revisions.

Regards,
Xincheng

