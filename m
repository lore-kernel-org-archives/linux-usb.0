Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283193;
	b=kJe7cuMSvBPf2WKm4bqWIz42KCyPk/pa8GzHOLUV6Vls2zbkauvsRVNOY6/9gTTP9J0Z
	 Bp/lIZRAC28yVjUX2CEJQh7U4KhxDwi9NMIttmUPsI+7LygklVQt9e5gY9k8WlaBrBgcf
	 EV/rPCeQO2yXoB6wNIi0E0jH89DJF04IKWpfDZjOMZ/d3KLanAcb8J0IcghW9321oXf5e
	 7Nqj4D2+5PDn2lnwPIOtvnW/HujDK4jo6R0SdhmHbQmaqXxsPzYDAiGBIc5XULMtW+VjJ
	 1bcc2tUliDic6SvgrEXRq9BiO54qBkBQQsuULEZaHVCdhhP7k+vZVA+aRABux4YXFXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:In-Reply-To:References;
	bh=/xFKafHDsYELV/yo3mc1RPbd6e33UmkEhLPepVBsz6w=;
	b=1BV8G1JQsnLHMssRyYRCjPnpya+hsyjGmTAXiOd6o3qeoXx0WDDaoR570cPWIrv0Xz8T
	 FTog0GcYfZ6ap2n8A4yEAlf8iSkUH7lTbsMJhrM/8lj9z+IscjucqauPmBAXSxOrT8UuO
	 Z9J4g23fxPEHRPtvSJUxy6zbpE5Fb2wEtHqS9likm4GGq6mRDOiwjNlRo8/5EcdWjhIVv
	 nPsYf1FGsAZ8hEfut6csl0mPwVl04dXQI/bOa84VUTDZf1oam11u12sK2/C/tQrC6dqj4
	 RFJ6CZcI9llfj79RQST+R6PaImMdQwzjZ4EZuDTP8E1z+6NuKJy551XwXcKnGgjpD0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjBrmZh;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF5C606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 14:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEF5C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjBrmZh
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14fc585291cso1955845c88.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283192; x=1793887992; darn=vger.kernel.org;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xFKafHDsYELV/yo3mc1RPbd6e33UmkEhLPepVBsz6w=;
        b=XRjBrmZh6F1LgOxFM1Mrmf2N4R4LkVMGUxdWWCjXaHlvkDw4dwEJu2VVNpSGx2pjjU
         7NVnUGooupEqB4vj8DHFDK/B51AvOYcvQCgLyiVrveSXlghSBh/fiMPyzsKN8KL+tC60
         qhC80/GQ4oZLuPJ47RvXq6dvWd3zndVtlm+TF8N8bz3leKaIBEVJSe5Eem0CwUQ0AUnG
         xvqf51zQ8wgQ2rRpeMUgYhPyhabA8xwKtpzoIQAQM0A8VYeSAJeE8AFChJYnokZLrmsF
         66GDIymu4NvNOZDopstIPohNeitWL4Z+/AQmid6bTVYJWKAWB62tc9+D4X51aKnvFTkA
         K+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283192; x=1793887992;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xFKafHDsYELV/yo3mc1RPbd6e33UmkEhLPepVBsz6w=;
        b=iNnGbIehnezRV6DMSTw5nVD1QSH+Xy1sJe70JMi0zHegzmV2iIRlq3CO34psH0inE2
         JWXDqGi8Bs1yniGi5xE8WS51Zc0yXU+cScvbdlPu7XYMnY5QGtvSx6ch2iJUpB37zn9Z
         JuDH6al7MqIqzlJSxKY/On96/PKo+RcWRqwJ5XAtET4hiJhoIUi6CrppDbaMj+77dnAn
         9yUh1eqIcA20KUimwXTivpsnp6S239EfFSl2lNyVSfQNW/sst7d1AeUWXRbKBEhllL6x
         Y+brCLKYQUXBvdAfI1kz8GKeqbJSUyPejDz4Rfwh4N3d7ZrAGc4AQTKL+9Ea9FmBGKoc
         QpeA==
X-Forwarded-Encrypted: i=1; AKwUvBzigZJLrGIFuD0PXUnti4I+XUDtbURtN0L3nxysgtYQDweYdbHdmT7U8GOb+HchrjpP4ta0Psc3uYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjHRlcw8BZ+6KxHdIazjvY3k2vYSnhxoP44pK/geGuLVI3UiSR
	ywezWQroN3Hue/dtB/rBYz4MjHH+yobpUQroafJQ98Pkvu+NPp18386Y
X-Gm-Gg: AYBFou3GWt8/uWiRaUQwSj0puP6uKPV3m+91Y1CgTV+NPQ30K8p58x1M/ddQTvTkExy
	jHP1K4iefXEzv0s6aESyVJ7/gGdASQDDG0LWmfrckvb+yeA8riIxOd0XSK1yH8WvzbpsbTHbhE8
	n0WhHUiHwxL47YB4IdZl7ioq36HwDrxK2EJgnuKOw0SrnhCSM0Ob3oBscEhtxXLRUybGw0MUl+i
	tEhr2JLBsFm7KPqgLV7EjGmH1rwVzdiGtLCGreWv+i4/TsaCuvF35dFhGZ2Hau2bXMLFhhhvCIg
	H/jFDGhD8DHPh7VunFqaWeAotEwWj+IQA+acEHapX2mYXn7IambgM4LIMkNhZwEFK6Cg6qxi7CQ
	aLf5WngZ6PXCi7/AHF19tmFbZvjMenq0S3gJjhDZx0ktcbrNU73+4x2eYp4jeOZdb7C7Vbaabaf
	JT4Urg2lt49QdyGSRR8P5iUKfluWiAEnAfiT31XEyn7EMCXcPFokQWu9bqI8HtIcTdAo8EUjYUX
	+7SZ3UAcJiB9TSp6/hnCpM8DX3WDXOV2nc01rUlkMtn39jl3XFs8BGTcrNwjUVhvy5ZLe7MYeMM
	EbHiqLfuEwkG+GMd8a76naMOWxcPVNjCJAWxZN+fecvhrTTvMCuEcg==
X-Received: by 2002:a05:7022:4390:b0:14d:ef19:246f with SMTP id a92af1059eb24-1a6d00d1754mr9997725c88.45.1793283190582;
        Thu, 29 Oct 2026 07:13:10 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:13:09 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To:
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usbip: clear actual_length after a failed receive
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314074.648427.388274461758949120@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
In-Reply-To: <179328314073.648427.8311262845412746237@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com>

vhci_recv_ret_submit() receives the transfer buffer for an IN URB.  When
usbip_recv_xbuff() fails, it sets urb->status to -EPROTO and gives the URB
back, but leaves urb->actual_length at the value supplied by the usbip
peer.  A malicious peer can set actual_length larger than
transfer_buffer_length; usbfs then copies that many bytes from the
kmalloc(transfer_buffer_length) buffer to userspace:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x79/0xb0
  Read of size 88 at addr ...
  copy_urb_data_to_user+0x36f/0x480

Clear actual_length on the failure path so the failed URB never carries a
peer-controlled length.  The URB is completed with -EPROTO and userspace
observes a zero-length, failed transfer.

Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 drivers/usb/usbip/vhci_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c..741107a 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	/* recv transfer buffer */
 	if (usbip_recv_xbuff(ud, urb) < 0) {
 		urb->status = -EPROTO;
+		urb->actual_length = 0;
 		goto error;
 	}
 
-- 
2.34.1

