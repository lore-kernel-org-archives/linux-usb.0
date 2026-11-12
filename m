Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523389;
	b=ECOV39lQJPCVAtsyzIhTOQ2+wTYq+Q6nHOaFeTqHtyaf5elENrhr9v+L2KcHTQRbz5rh
	 VxrdEiLUb0ojFerHh9KStpYQQIa6E2YMpJwRqJNBZkmeZkMchN8zJMcYw94T3mPhfgJJn
	 zTMwTbS9NnCDXDMm+aZOTDB7qijILR8Evy7MoRgHTPdbguVhNen+qi1bRaCaWvuZnzSnd
	 ndEEQOBBnLlWHGkZylqtOxyS7e5qeM2tYdjSugxfQcwTe5I9yLaV3YYvv1BqY8VeIABIH
	 Fa+cqaGnnflDXhFxg9TizJqxM/uHI3ODl7XDeDn74ZcMjLIrUf1hOin/LnRATU0QKAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wCaaAge3cM/XhxhpSkdSCksiqauk2dfp6q6vtBYhikQ=;
	b=uFYGQB/Ex+Wm+6NCeOScaVsXCVNAg32yJfo3NAQIiF9vXSWdJWMMN7BbEKnev6R2KQTN
	 vhZPjBTssSPuiGhJxJ6vrdsPcKn0J1OAxLF5LMNx4YFx47NQd1eV7OgD/72R48/yuD6Eb
	 QYgpARISROT3fIVU8mCvDA9+0abMXtm3tvrJLCEWUcWb2MEZ7ih3I7FjZ/GSHPj/5PUrg
	 B7pmyzTzxHT/J3VPnDVSW3WMF9OMjIf0txtNd/b03xG3id9evEl8KrlnZrzbl3N1cU/6D
	 JKc5dC8cqqoDaEdNOvvVuGLZmE2K2Un+/bbC0es5OI2sl8NCBDC+PkSFCEhru/1pxkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eDwDj0qH;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E319606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E319606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=eDwDj0qH
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84e513877a3so479605a34.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794523387; x=1795128187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCaaAge3cM/XhxhpSkdSCksiqauk2dfp6q6vtBYhikQ=;
        b=eDwDj0qHuHsyjDj1H4jVJgU/+TYQqgx59VsX+h2U3AOWBjgrr4HCswaOMuqyccknSj
         VFX6wS+UfIbc8bzU6kRP7vzl+FBL6ydQQyjrfaqRehErkY5KirZHLpHIZhbk+AyuMrj7
         HugKOOKpX1PCgkV6aKlkeOMNG+5zpCyKBzaPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794523387; x=1795128187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCaaAge3cM/XhxhpSkdSCksiqauk2dfp6q6vtBYhikQ=;
        b=njCxeKH9AdJhTizxWvTjDiwzI+wWWdBm39saH1E6/YNgzbKf3Pph6WiEF9jVX8EGI8
         bcRO/FxoosbYYv23tFsVfjJnV4YRnCSZySKxQmoMPHqgoLKT8XAMLgaQcRVZANp336P+
         YfklWfKfcCgZaEAY60gxAxJPjPuAUXFD/Y9+fZZsKR3tQyiENV/DBcm0GIHPvfVDFthp
         jhn3REf/wRaQrMwnD23XueG19lyZ6Q2Su0QEuyNCgT38j54y9bPNnkg7JKRk4Cn4NvQd
         j5SI9RpOplNW9SZkLojNnKqmKA8DIPiEiWxe9Fdk60GTCYbo3ESjmX1e7Hse4quoYTPC
         XIew==
X-Forwarded-Encrypted: i=1; AL+hErGXpi2TGHtjKKiXL22v16M0QuNU0cjk84RiQQzmJlsDPDQgzCsbVRqTTqc+IDMPPLCfU32KJagb0xg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gDjLPkH94WDpPclTqceZWYY0U+YG90XV5Z6WWca1zDq0x9AR3
	ZcbVC5qavn/fodiLQRDfA8C2qV+1gKaD3a/5BAYeuDwwa3BYL8Hwh9pe3zVdxvkco8M=
X-Gm-Gg: AYBFou25p3xqrD3b8JRs5+qJwTa1EefeIfySDQ7Dvvc52G8hDU3txAY9QuQRTaXFK9/
	DBkVvP2d+f2Vh88Wb4wcDJS3SbTK/NLrwsj2/zpKRjoEfy2eKGdc6Jpm7fVCeTb4czJPR02V+/N
	UoqooVi24uZ8hVAQCyCnsK56W2//p28S1vn1Az5k/7OcU5oQWT3NSrPCj/MTyebdm7eQ4gpMfpk
	Ax7b5tOJgDfh9xtwYS9np6prSbGZKFnOViHGKB2NmiFxSIiBSoBdYTHidHJKl2M9LL3iC5B4Es5
	Y+Mm988S/qkcE0VAf/D/4fhCzZSSK07EnhsyZDf592a2G1vp83BITFhrrttcnq7PpU24+62bMfW
	BTjALWfoxqeKKg7aqh1aSmEWuzyrVunzkJLH1VnTBc4QW326nqmVu/Di3R6MsIkDNyzZAjGSYm4
	15V2BSMfX0VQO+JW4/uLZ2tUY0+1jPHb35wLCm9mWljAvDHGyY9h4wDSoE6bjTjk7ZD2hieysh8
	+mZZfvsy+ZGBdzeDsB9kALOj/LGuSXrntis26TkjCxsfep0h7jdMtzp3KRwbUrycA/qHD6G/35V
	OtsTDezP0MntRKed9pWqdFqUXV6IrXN3kpSAXQ==
X-Received: by 2002:a05:6830:442a:b0:845:614b:eab9 with SMTP id 46e09a7af769-86152677024mr2746654a34.6.1794523387032;
        Thu, 12 Nov 2026 14:43:07 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e3d0sm886096a34.3.2026.11.12.14.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 14:43:06 -0800 (PST)
Message-ID: <c9154293-a804-44a2-9eca-d27d1f6cdb03@linuxfoundation.org>
Date: Thu, 12 Nov 2026 15:43:03 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usbip: vhci_hcd: fix URB giveback leaks and
 disconnect races
To: Raul E Rangel <rrangel@chromium.org>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Anirudh Rayabharam <mail@anirudhrb.com>,
 "Brian G. Merrell" <bgmerrell@novell.com>, Suwan Kim
 <suwan.kim027@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20261021150704.3129446-1-rrangel@chromium.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261021150704.3129446-1-rrangel@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 09:06, Raul E Rangel wrote:
> This series fixes a set of URB lifecycle, locking, and disconnect
> teardown bugs in drivers/usb/usbip/vhci_hcd that can orphan pending URBs
> and wedge usb_kill_urb() and usb_hub_wq in uninterruptible D state when
> a virtual USB port disconnects under concurrent transfer/unlink load.
> 
> Patch breakdown:
>    1. Protect urb->hcpriv accesses in vhci_urb_dequeue() with
>       vdev->priv_lock inside vhci->lock (matching vhci_urb_enqueue() and
>       the cleanup helpers), and add a !portnum || portnum > VHCI_HC_PORTS
>       bounds guard to both vhci_urb_enqueue() and vhci_urb_dequeue().
>    2. Track whether an URB has been moved from vdev->priv_tx to
>       vdev->priv_rx via priv->submitted under vdev->priv_lock, and
>       complete unsent (!priv->submitted) URBs locally in
>       vhci_urb_dequeue() instead of queuing a CMD_UNLINK PDU. This
>       prevents vhci_device_unlink_cleanup() from freeing the unlink entry
>       and orphaning an unsent URB on priv_tx, and prevents CMD_UNLINK
>       from being transmitted before CMD_SUBMIT on an active connection.
>    3. Clear vdev->ud.tcp_socket under vhci->lock and vdev->ud.lock in
>       vhci_shutdown_connection(), reject vhci_urb_enqueue() once
>       USBIP_EH_SHUTDOWN is set or tcp_socket is NULL, and drain all
>       remaining URBs on vdev->priv_tx and vdev->priv_rx in
>       vhci_device_unlink_cleanup().
>    4. Move the URB_DMA_MAP_SG clearing from vhci_recv_ret_submit() into
>       pickup_urb_and_free_priv() and also clear URB_DMA_MAP_SG in
>       vhci_urb_dequeue() and vhci_cleanup_priv_list() so USB core does
>       not call dma_unmap_sg() on unmapped scatterlists on any giveback
>       path.
>    5. Allocate struct vhci_priv with mem_flags before acquiring spinlocks
>       in vhci_urb_enqueue(), and return 0 (with VDEV_EVENT_ERROR_MALLOC
>       triggered) if struct vhci_unlink allocation fails in
>       vhci_urb_dequeue() after usb_hcd_check_unlink_urb() has already
>       marked urb->unlinked.
>    6. Serialize vdev->udev clearing in vhci_device_reset() under
>       vhci->lock and ud->lock (dropping old usb_device and socket
>       references outside the spinlocks in both vhci_device_reset() and
>       vhci_urb_enqueue()), and reject URBs from a stale usb_device
>       (including address-0 requests from an already-registered
>       usb_device undergoing USBDEVFS_RESET) if the same rhport is
>       re-attached before usb_hub_wq finishes disconnecting the old
>       device.

What problems does this series fix? Do you have reproducers for these?

thanks,
-- Shuah
