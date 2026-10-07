Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129083CAE95
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405686; cv=none; b=QJT+3hW8sfjp5JDy4Qcy5+I7mVYjGbs9W1oUahFPhBJdox1Q7DLaa7kGjFEONch/Fel2DncHW1bgi0uRH/HlyI/GTlWszGtb/fmFiU7jeZIgR9mIWJXXlCoHYpKRWVMIocRTDWxGq/1bQQaV3E28zKljWEqPXPqz1s8oC3+0oqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405686; c=relaxed/simple;
	bh=PvtfH/k8z1BDjmBe0wFt7OCs+OdclqZtP44M/KA9cWk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c27+N2weM/vLZWGKgPPzSBRju+kqIlDrRxudCu40LH3OhYdwjStpprTYrdHTm22/jHlWdYLBV2l1kkgYXgP1v1DJm5ByJEhdLN9OuN6/vpt0uFGc4vWdOiRA+Kc662MOgGRiIw9vmRGO0w8W3HUk6+vaP7unWw43s6xF2SZH6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pva2+NEx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pva2+NEx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so14902625e9.2
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2026 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791405683; x=1792010483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73BVDVpDiA70xXPSPckSoCpnSylvrTOc8nuDs4dKWHg=;
        b=Pva2+NExCW+jsdAElXT7f1Z3+F9TUX40dIe/xvvL/8tZgDUKq5qyMiqslufuKp2uYm
         kBbgSD/JAKmMPYvBAgcYWaKYwrwOMlQC0NbSty3kZxibBeklP70hsJ9GeX2d1tflFKFP
         wJqHu57o6XQ/FiZL6hbI4ZzaUyFZchWKSc/74L1naK+uVy8fL88reN27MMr4z2eFJtAA
         2oEDoQHZS/4UK6GFq7RjDRtsjCWK2OlpXoi+njzSEZFsGK8J9Ofmvjzjm+G0oOH3+58H
         TwT+x1ky6gTVNWh+hq8l5QyUAKjOLhTV6FtzphG7LJ/81orlIn132KUgpAtEXUaelzxs
         ENLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791405683; x=1792010483;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73BVDVpDiA70xXPSPckSoCpnSylvrTOc8nuDs4dKWHg=;
        b=2vFmDV3+CwOKbGDh1Llr0EiKCQOVLv3pM8W5WGW9/ovbvpmSrpoLHR+jWG0VSiJWNu
         PQ8xzew74DGIadz2OT/lnvx7hS9hiw8KV/wm66o52BuBsdTFyIW3oMhiqVl9C+jNXpuO
         v4/KleGD7bxZcFxtHcHMtTZQQss6T0bNvzGAsvuWlKG5NjBbygGgUC+/8DmSRlXER6Fz
         b9TLYC/1IJh/hUZmHFcMHcl3p0i8Qu/wtyCG0ZPUz4aSt1bPc6MzzJWCtJzGXa5i1uwb
         h3WuXCygWFrdj9LgLyCQuZRW/f7lEU0juCPMDiDQmXaaJOZT+Qv3iw6dg272lwAuasQt
         5yPg==
X-Gm-Message-State: AFuF++kSBvtVJhGYOIGmnyI60e1nHMrad66YQ3jHmhmnGrwTCqgC/N6d
	R/rjmNaoW7wH2rv9EDrl953ZGkKA92spLgu/z2jHlEnOfnV2bg4Hz1DB
X-Gm-Gg: AYBFou2VKVzOWcRkeSNfWze3wlEl0Pu61qwvGdtldWPHsTS2UnLlhzjuaFqR84ho3QO
	tIZbM4DX1HHfoNYuzBK1Y0I02DcSn7Zi7E0Tg2yZLkBGDiC1Gas2Sx7Vpe47wCTzrJfnuhVKAee
	tPcom8Ud2ag5qz1lRJyNK1Ah0IIxrspLJOXpzKa0IW0rvFHh0c0UYi+q80rO0FlwM90kRr54kxp
	4y2fpvjCihdlXyslQPIBGucDppHSwpXYIhAkj6IRdk9GpOVZzbA+zSIc9rj8CUa7ZdhvReim+T7
	sLR6lbD4Dy+XE3XeruZ7HY0G3Qn8XZk/rHHGhVe1J6lcrHaaSY59Sp9Pup+Mpa2KsxbeCDiyxhi
	ZvEOwmllssehfL2HnhGflE0/PIHqomAHES1KrPTrsqe8MkAdiPmxbVYHMp8vRwI/zXIoJ7ONOz8
	PLUD2B8R8IFokxvqYDOtWyvTpI5KXwmqNSqZ39xxXmJ+0weWk5zhuZO5LCd/f8Wmq57EhDvrJ7G
	YRqgF+nbw==
X-Received: by 2002:a05:600c:3f08:b0:4a1:7703:e537 with SMTP id 5b1f17b1804b1-4a180313b66mr53230165e9.10.1791405683281;
        Wed, 07 Oct 2026 13:41:23 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18044c970sm50776585e9.4.2026.10.07.13.41.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 07 Oct 2026 13:41:22 -0700 (PDT)
Date: Wed, 7 Oct 2026 22:41:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Giuseppe Piscitelli <ooonea@gmail.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org
Subject: Re: [RFC PATCH v2] USB: core: emit a device-level modalias
Message-ID: <20261007224115.755ce40d.michal.pecio@gmail.com>
In-Reply-To: <20261007191130.8652-1-ooonea@gmail.com>
References: <afcecb34-0024-460f-bc21-a7f2b1754d23@rowland.harvard.edu>
	<20261007191130.8652-1-ooonea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2026 21:11:30 +0200, Giuseppe Piscitelli wrote:
> On the first insertion of an iPhone (05ac:12a8) after boot, an already
> running usbmuxd can select USB configuration 4 before the charging driver
> apple-mfi-fastcharge loads. usbmuxd is a userspace daemon that uses libusb
> to communicate with Apple devices; apple-mfi-fastcharge is a USB device
> driver that enables their higher charging current.
> 
> USB device uevents have no MODALIAS. The charging module instead loads
> from an interface uevent. Its registration reprobes the device, unbinds
> the generic driver and calls usb_set_configuration(udev, -1), tearing down
> the interfaces and interrupting usbmuxd's transfers.

What is actually the appeal of apple-mfi-fastcharge?

It seems to just issues some control requests to the device when
commanded by userspace. Userspace could do the same with libusb,
apparently without unbinding drivers, changing configurations or
even claiming USB interfaces. I just tried a simple program that
queries GET_CONFIGURATION, with no disruption to kernel drivers
or other libusb applications using the same device concurrently.

Then simply blacklist the kernel module and all its problems are
gone forever without one line of kernel code?

Regards,
Michal
