Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173242;
	b=yXUf6KsqgyL95lEzIcJM2v4oMrj7iav+QgofYHrf3aESOsF1LjY3XODYRX990/rK3Yl9
	 yJH2lGuuCMfe2CWKJS9BeuzN4BGoHlQ4BbBYnKl/uzwugSlK8xgo9AxF19eukl+8A5Ci3
	 8884IObdRSDz1mewZ5B2DRP/nVvcA9L7uOGxbjDmmDeoJ982GcS2yAoDpO86+6k03hdFO
	 NBQ77nR8WmGhyrLkwOF6N1sBNM9Z+lBeqy0/3/WnlodSkO6rcrw5F5OEZuPTLfNIVFp7y
	 WirNSJZTRemK73lmnaCWKIZWgWJgtKLVa9iDIZblV8tINgD+EOWXS5gatx3ZacZAggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c5TP8QN0A+61hAuSZdjk63ActRIUkjcmDfLAhcw9riM=;
	b=wlzU7LK41nr6gW/hyaD4MGVX/rD2dzJtvyE9bX2l8ySUwIvYo5BzIumB3US89J8JAgx0
	 hsnSmIkiY88FONXEefQfNTg7vl34nbuUSQ29yWPg0dSgVZ/AThmqV/UyT/lcmqzpyfzLV
	 qpDY2r75arq4VE0HDYrIYAyyw2Pnm9x1+g3SAeRijQKI70dlkbZgC5kV0NKsFt7X11nAk
	 +zAT0NZi5FINOGfZMKRn0c+wDPVaNiGmIc/M3AHXhOx/IhWZ5s4GNha9JwmkQOqCOVjUY
	 +X14Iqt09s2nEYCsRI5Dxfe3j+EkY+PUNGHrr2KJ0HDZsIUvArm8KdcEqi9wguooAfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAodecJY;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96962606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96962606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAodecJY
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so448832f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795173240; x=1795778040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c5TP8QN0A+61hAuSZdjk63ActRIUkjcmDfLAhcw9riM=;
        b=fAodecJYdDh5FrLQntGkHTfvuTZG4mAqmgdlpnvwepAyDXsAoBKUgwtS+BdGC+QZQI
         NxKqqLZ/Ei6FNNWSA1uSl/QJ52OjQhL9KmxDFcaqb4daPgepHmwHR4ntiZjYtOPySAHE
         etzdAeZ1HUqVOf2fsEnVLTL0565Sy9sGlbhKst2zvg/P8bwybGMmwmwcihAMyQeTfWwb
         6+8ndLbJPLsux4RE69l2+m/GFp22WxKS78HMVnehbl/XKkyOjVTscrsLDLhqG1pJ8q0v
         BsbmFpuGIwdsW+t5JYufilRclbN2LHdbRBiG/BQ7hLLnuloGJegwXxAkKodjJhjkcqSL
         tXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173240; x=1795778040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c5TP8QN0A+61hAuSZdjk63ActRIUkjcmDfLAhcw9riM=;
        b=NGs8/rwCa2jvX9DYQS+0IjsOQdFHRBUYke5DEJ5eRHjSttOpGL8lG388lX05PF7vwT
         ZgcWY1qfG0uZ57G2/8eZxTHWfzZ8YT+8INUXzlYp3zzLFNema6CDopE3BgUGMEqbb+sh
         3yVBBxnP2XlTdLMLY2c8GBhv/+l8M+ZCjauEcUEhYaHVs8TqmF0HDVvQ1ERzdHneEdD+
         eYtCINzSIoF+FOGl6vmZwrpQxuaWHniTnOuRTFlzjUxKkZhp3KFDjvvHc/TEilQUCyXI
         DjxUswWY3tV5EKEvD/lUMCtFPzF+357qCCrL5HPrWnAR8TEpS8bT7YcG47ZG61/crv3j
         Sy+g==
X-Forwarded-Encrypted: i=1; AL+hErGYXiX2947froRDvOUCLhFCyZxjXrBwRj2eiTR5VCKXfeLoBHUBnOe2NaFqRX9YoaYSSfJkKCXb1nM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b3Hp87xilE8PhblBYsVzB37kunp54Hn1qI0rmI5/S+0NNwJR8
	8MztKETPhBxoMl+ssi0SiCSSRWOCeyyDcYHItgbydYXya+bZCjJEKLY2
X-Gm-Gg: AZFdTZcgZCCaeLiCt8qI1V7RJAzy1V1EVSjvc0gpy8PNPnbekx3iNTfPWeRr5lv3yO5
	jDrPpIPS8szdvQFiad1ikmdFNxT+mUrFBYYW8hDBDLb4/zg4rhgBL0Wokrxtykt1JgnAm591k+X
	Ihp+OlkugzWrnDLfDuazP8/dVRU+oLqQ2NmzOItQjEI17nMSt/TR4wQmP/f9ga1Vb4Xch4ocjqf
	0+ar6KoZulKCOm2mHOLq7810+FUvQXis3pHBKGUEfcoT8h/4gcw7UrPMsORH8FlUxfGTfyNb0+B
	O1ILKZ0eoDrEtCjGFFzapyWrYYUFPt0trW0cjYYRFqZ5ggs+cp72Crk5Fmh1qkD5oXgpYVBQwVO
	KbrBuzDTWvEahn0DTJOzSGW08MBRA+gV+1zZHjg7oeLFNivdaxdWj2HKqTV+5wd886wpeICEPIJ
	SB7ohdBWU386UITgV13gNx2EwLIPHrvarE5l7+G6xmPB7u6smq9bnIJ6RZbkgrm8CAdikdTdBin
	bC5dURdZCNVyIp/Yr6QPrQ2OVqKcKeJ4dmCnVfVCBi2Wu83KrTFexHa/8hvd/8eWs5OxX3Fw+wK
	ewfcUexel5zfWPD8Yg9qvtXCzh34dSd1gdHaM9OeFQ/hDERvxJ9Ii1/iXE1HDJw=
X-Received: by 2002:adf:e012:0:10b0:48e:3697:708d with SMTP id ffacd0b85a97d-4abb0d51ab2mr3805002f8f.12.1795173239827;
        Fri, 20 Nov 2026 03:13:59 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm4905165f8f.7.2026.11.20.03.13.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2026 03:13:59 -0800 (PST)
Date: Fri, 20 Nov 2026 12:13:57 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Riley Wagner <riwiwa00@gmail.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, stable@vger.kernel.org, "Mario Limonciello
 (AMD)" <superm1@kernel.org>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH] usb: xhci: pci: do not perform Soft Retry on AMD 500
 series chipset host
Message-ID: <20261120121357.1e1a0ce4.michal.pecio@gmail.com>
In-Reply-To: <20261117193300.25897-1-riwiwa00@gmail.com>
References: <20261117193300.25897-1-riwiwa00@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 11:33:00 -0800, Riley Wagner wrote:
> Full-speed HID devices hot-plugged into a root port of the AMD 500
> series chipset xHCI host (1022:43ee) enumerate and bind, but never
> deliver any input. The device then resets itself after ~10 seconds,
> re-enumerates, and the cycle repeats. Devices present at boot are not
> affected.

I doubt that this affects all HID devices, people would have noticed.

What if it's not connected to the root hub? Is this important?

> With xhci_hcd dynamic debug enabled, the first poll of the interrupt IN
> endpoint fails with a transaction error, the driver performs a Soft
> Retry, and the endpoint never completes another transfer:
> 
>   [ 6658.313453] xhci_hcd 0000:02:00.0: Successful Endpoint Configure command
>   [ 6658.352348] input: ELECOM TrackBall Mouse HUGE TrackBall as ...
>   [ 6659.424165] xhci_hcd 0000:02:00.0: Transfer error for slot 29 ep 2 on endpoint
>   [ 6659.424170] xhci_hcd 0000:02:00.0: Soft-reset ep 2, slot 29
>   [ 6659.424290] xhci_hcd 0000:02:00.0: Ignoring reset ep completion code of 1
>   [ 6667.989369] usb 1-9: USB disconnect, device number 30
> 
> usbmon shows the interrupt URB submitted at enumeration and only given
> back by the disconnect, 9.6 seconds later:
> 
>   2562187476 S Ii:1:030:1 -115:1 8 <
>   2571824873 C Ii:1:030:1 -108:1 0
> 
> No further transfer events or errors are reported for the endpoint after
> the soft reset completes and the doorbell is rung, so the TD is never
> retried or failed.

IIRC that's the same HW bug which broke some high-speed Realtek WiFi
dongle and caused Soft Retry to be disabled in multiple variants of
Promontory chipsets. I actually obtained that WiFi dongle (long after
the fact) and reproduced the issue - it happens when a device fails
the first URB and it gets retried. Most HCs handle this normally, but
Promontory generates no transfer events and later fails Stop Endpoint
with Context State Error and the endpoint is "halted".

And I think I have seen similar issues on other ASMedia HCs in case of
disconnection and repeated retries and endpoint resets. OTOH, in other
cases this controllers perform retries correctly.

I will look into that, because maybe we could only avoid the particular
retries which fail (and also add a whole lot more PCI IDs).

> This matches commit a4a251f8c235 ("usb: xhci: do not perform Soft Retry
> for some xHCI hosts"), which disabled Soft Retry on the AMD Promontory A
> hosts (43b9, 43bb) for the same class of failure. Booting with
> xhci_hcd.quirks=0x10000000000 (XHCI_NO_SOFT_RETRY) makes the device work
> reliably after hot-plug on the chipset root ports tested (1-3, 1-9); the
> same device also works after hot-plug on the CPU's xHCI host (1022:149c)
> without the quirk.
> 
> Tested on an ASUS ROG STRIX B550-F GAMING (BIOS 3621) with an ELECOM
> HUGE trackball (056e:010c) and a PFU HHKB Professional HYBRID Type-S
> (04fe:0021), on 7.3.4 with commit 6895dbdc19d9 ("xhci: give back TDs
> and clean up ep0 after disconnect") applied. The trackball showed the
> same behaviour on 7.2.x.

I suppose the keyboard also had problems on 7.2?
IIRC it's that one which always disconnects itself on initialization.

> Add the AMD 500 series chipset xHCI to the hosts that do not perform
> Soft Retry.
> 
> Fixes: f8f80be501aa ("xhci: Use soft retry to recover faster from transaction errors")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=202541
> Cc: stable@vger.kernel.org
> Signed-off-by: Riley Wagner <riwiwa00@gmail.com>
> ---
>  drivers/usb/host/xhci-pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -88,6 +88,7 @@
>  #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
>  #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
>  #define PCI_DEVICE_ID_AMD_PROMONTORYA_1			0x43bc
> +#define PCI_DEVICE_ID_AMD_500_SERIES_XHCI		0x43ee

I think "PROMONTORY_19" or "PROM19" would be better for consistency
with other entries (see also: commit 9e896b4a48c4).

And isn't 1022:43ec another PROM19 ID?
Does anyone know if 400-series or PROM21 have the same bug?

Adding some AMD people...

>  
>  #define PCI_DEVICE_ID_ATI_NAVI10_7316_XHCI		0x7316
>  
> @@ -493,7 +494,8 @@
>  
>  	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
>  	    (pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_2 ||
> -	     pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4))
> +	     pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_4 ||
> +	     pdev->device == PCI_DEVICE_ID_AMD_500_SERIES_XHCI))
>  		xhci->quirks |= XHCI_NO_SOFT_RETRY;
>  
>  	if (pdev->vendor == PCI_VENDOR_ID_ZHAOXIN) {
> -- 
> 2.56.0
