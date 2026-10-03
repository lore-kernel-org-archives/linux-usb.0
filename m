Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E43F5BC3
	for <linux-usb@vger.kernel.org>; Sat,  3 Oct 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022891; cv=none; b=r2Sjaqp5DfkTFOaewde03bEt6F3Z7/JmSancdnODf7n3raELWfKCUKjl/NpfAc3DG4yPUoFGdzlSYn6aGkeQIXL9/sDGDSIJZB3852EwJsEnEZa+FWnlzfx73cd4Iep13T91PK89tCSknhg2lVBVx3IU2VqUgjA6tIvFdbcTEBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022891; c=relaxed/simple;
	bh=HUAifVwvhjFSZH+qHWrpvA4a0PkwgedCTTmYFd8Jp+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6q4BCQhlc2k+qpyHlAROirujJNmgjh1GlOX1fLCJqvaRp3g+RQWVkvdCteTqIuCwuuu23XEs+tTCpdvdH6E/iUnUF8P/h8pda/RLtZ7h+/3/iMi/EW1KupmNXgxWpl992dBsDTMxaoJd9ovhEopS6CvKVqStyraHNDzJyRLzsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J4ds8uEE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J4ds8uEE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6091F0089C;
	Sat,  3 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791022890;
	bh=zeS5KH5NXrMumhRZYtaFzDJVeacircig2X0eJ480vQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4ds8uEEYciC6vCk1iC7qyl/reWgzfb+DmSOXKp+amx44SeWt323QG7WDTnmkBHvQ
	 +FexxGCxqRZ7MIxXIKhlZTcbZZvVTPCoB2Dj0W3u7yz6obwcnIbuTfkNdmoVOu78q1
	 bQ9MPwyuEc0qlsTnR/jj54TF77zSg3IWVK4tfakg=
Date: Sat, 3 Oct 2026 12:21:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Hornik <thomas.hornik@protonmail.ch>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>
Subject: Re: Razer Basilisk V3 (1532:0099) cold-boot enumeration fails with
 -EPROTO on AMD Matisse xHCI
Message-ID: <2026100336-paternity-cortex-3692@gregkh>
References: <HHq_OCxl9RI-5ZzRAxURVsf30En7t418EeJNcfCR9WFSf5EFK2WKxDHfzCTo1_8ifuH60WiBNe9env2XOLmaFdlePVioseIIWrP2-du5Mss=@protonmail.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HHq_OCxl9RI-5ZzRAxURVsf30En7t418EeJNcfCR9WFSf5EFK2WKxDHfzCTo1_8ifuH60WiBNe9env2XOLmaFdlePVioseIIWrP2-du5Mss=@protonmail.ch>

On Sat, Oct 03, 2026 at 10:13:56AM +0000, Thomas Hornik wrote:
> Dear Linux-USB team,
> 
> A Razer Basilisk V3 (mouse) fails to enumerate on some cold boots. The failure follows the device across ports and across two AMD Matisse xHCI controllers. Other full-speed devices on the same root hub enumerate during the same boot. A later connect of this device enumerates on the first try.
> 
> Hardware:
> ASUS ROG STRIX X570-E GAMING, BIOS 5044 (2026-01-04)
> Legacy USB support and xHCI hand-off are enabled
> CPU: AMD Ryzen 7 5800X3D
> The xHCI is the X570 chipset, 1022:149c rev 00
> AMD Matisse xHCI [1022:149c]. 0000:06:00.1 subsystem 1043:8808, buses 1 (USB2) and 2 (USB3)
> 0000:0d:00.3 subsystem 1043:87c0, buses 5 (USB2) and 6 (USB3)
> hcc params 0x0278ffe5, HCI version 0x110, quirks 0x10 (XHCI_SPURIOUS_SUCCESS only; no Matisse-specific quirk). Device, once enumerated: 1532:0099, bcdDevice 2.00, USB 2.00, full-speed, bMaxPacketSize0 64, 1 configuration, 4 HID interfaces, bus-powered, remote wakeup, 500 mA, quirks 0x0.
> 
> Kernels: Ubuntu 24.04 HWE 7.0.0-31, 7.0.0-34 and 7.0.0-38 (all 7.0.14). The signature is the same on all three.

That's a vendor kernel, nothing we can do about them, can you test
kernels we release (i.e. from kernel.org)?

> Over 33 boots from 2026-09-18 to 2026-10-02 the device failed on 8 and enumerated on the first try at about t=1.0s on the other 25. Failures were on usb5-port1, usb5-port2 and usb5-port3 (0000:0d:00.3) and on usb1-port1 (0000:06:00.1). On the failing boot below, usb1-3 (Kingston HyperX Alloy Origins, 0951:16e5, also full-speed and 500 mA) enumerated at t=3.13s, an EPOS dongle at t=3.57s, and a Genesys hub at t=3.91s. A Logitech Unifying receiver on the sibling controller 0000:06:00.3 started at the same t=0.68s and succeeded.
> 
> xhci_hcd owns the controller before the failure. On two boots the device never appeared for the rest of the session, one of them about two hours. On two boots a later connect on the same port succeeded (t=44s and t=74s). The log has no disconnect line, because the device never enumerated, so that later connect cannot be separated from a replug. I do not have a usbmon trace of a failed boot yet.
> 
> Log from 7.0.0-38-generic, monotonic, 2026-10-02:
> 
> [    0.440060] xhci_hcd 0000:06:00.1: hcc params 0x0278ffe5 hci version 0x110 quirks 0x0000000000000010
> [    0.446076] usb: port power management may be unreliable
> [    0.683470] usb 1-1: new full-speed USB device number 2 using xhci_hcd
> [    0.805501] usb 1-1: device descriptor read/64, error -71
> [    1.035503] usb 1-1: device descriptor read/64, error -71
> [    1.250606] usb 1-1: new full-speed USB device number 3 using xhci_hcd
> [    1.370316] usb 1-1: device descriptor read/64, error -71
> [    1.593663] usb 1-1: device descriptor read/64, error -71
> [    1.698701] usb usb1-port1: attempt power cycle
> [    2.077621] usb 1-1: new full-speed USB device number 4 using xhci_hcd
> [    2.077718] usb 1-1: Device not responding to setup address.
> [    2.282692] usb 1-1: Device not responding to setup address.
> [    2.490609] usb 1-1: device not accepting address 4, error -71
> [    2.490673] usb 1-1: WARN: invalid context state for evaluate context command.
> [    2.602611] usb 1-1: new full-speed USB device number 5 using xhci_hcd
> [    2.602705] usb 1-1: Device not responding to setup address.
> [    2.810696] usb 1-1: Device not responding to setup address.
> [    3.018608] usb 1-1: device not accepting address 5, error -71
> [    3.018674] usb 1-1: WARN: invalid context state for evaluate context command.
> [    3.018720] usb usb1-port1: unable to enumerate USB device
> [   44.019328] usb 1-1: new full-speed USB device number 9 using xhci_hcd
> [   44.161779] usb 1-1: New USB device found, idVendor=1532, idProduct=0099, bcdDevice= 2.00
> [   44.161789] usb 1-1: Product: Razer Basilisk V3
> 
> The descriptor reads return -EPROTO in about 120 ms. initial_descriptor_timeout is 5000 ms, so the host has completed the control transfer with a transaction error. "Device not responding to setup address." comes from xhci_setup_device() on COMP_USB_TRANSACTION_ERROR. The WARN is xhci_evaluate_context_result() on COMP_CONTEXT_STATE_ERROR: Evaluate Context ran while the slot was not in Default, Addressed, or Configured. That warning is on the Address Device failure path. The first failure is the GET_DESCRIPTOR about two seconds earlier. hub_port_connect() then gives up and calls hub_port_disable().
> 
> usb_detect_quirks() runs only after a device descriptor has been read, and these attempts never get one. An entry for 1532:0099 cannot change the failing transfers. v7.0 drivers/usb/core/quirks.c has 1532:0116 and 1532:0e05, and no 1532:0099.

So if you add a quirk for this device like the other entries here, does
it work properly for you?

thanks,

greg k-h
