Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B6373BF3
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 04:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546505; cv=none; b=UDA8OqmOzuUi7i5ww43UNyUV/Ucs3e3tVIuLM68MWjpxgPUiwp+tUSjEkpjLc6vzWx0iKttpKzZlEfnXS9uai0UMNDScj+NfdIU8zUoD7lmHMvSzA3NbjgOcsiCiG8OFevfdagDU/pPr+FCRXvPmVS5yqFTm9dYx1nJ8TqDxR0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546505; c=relaxed/simple;
	bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t5sl7yWycocQnWjHhdQc1vhzBW3I8j1ahRdi2kB+IWvbODVlqJNUzSsBLUN7ecIQro0onoDjOeWcZP8fw1VWFP/8qj7WRHnAUBc6mqw6cHeVheo8LeoIX02CE9R5zyoOaiCSfDYqvWKEAtKvKz/wbvQyPCcG6YA+M8vf7VRVoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frhXAyrk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frhXAyrk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3523861a91.2
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 21:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787546504; x=1788151304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
        b=frhXAyrkD2B0+vox8lN4kVYFXdQUQzMh1DcyqiFSPsyMloguXJX567r0imziVkcmjg
         y6cJZIuU00GaLWDjsr4RQsLE7ZGU6/KU5McNTyzlXr/BxgYEYdWi0LmSbVT6BOuFNzF2
         Pq/+94c5GA6B1/MTqSFyjPOVklCH8BPJLJnh6hSFoMS2vJBagqrTQlNAYeg/qLtMNIVL
         YRlWWfKpDoe727CZZv8N6z30z4CilH2CQRVeqS2MFf7mDxco8GoCKzzOU90ZlFv7Oj8R
         GpSvBmSPtpjQDsGMi0r7wTnUmzOsfyv2ZAMZQxtQy26d0EHx0V5mYlVH1QH7Cd+VXCcl
         eeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787546504; x=1788151304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
        b=kRx5AS7OpM2/I3iTk2LTpA+yC9xFHqLYQErm3xcaVAhp6BrlekgjKPoYX9J3ZXJid7
         QYSQC7833Tzni5X7l16EwAaswe3xww5VXBQ04PEWThbAriQDs9uPPgoqIbj5tbRWI+LR
         6fBHxe5+f05qgdss1eehjsTIzwVrhZcOaRLfp3oFosxaAzERR2N1/TQx5uiK2Jjy0nxO
         ONutYvjlXNwdCnP4FolNvl4qDnuzLYnLNOO6Z5UMTc6GijxXYAAjPau+Tp+Qji8Gf1O6
         /OnkAvlLkRpmX5AOnOrHO3FTL0GlbxSav5p9owuhhwa+Y9j6FsVcGxlh/uCX/jwFIt65
         VCKA==
X-Gm-Message-State: AFuF++mdcwofvZxIwUKscCUfFEBajtl1Ewh5H+EDaEz8TeLum951L1iO
	FFrGcsp/DTKufIeriipPXQPsdXidgGr1hoW/9896KLnDsFkMGNKhVYtOJwcbRBpDCos=
X-Gm-Gg: AR+sD12Ge1zP/ymEtoE9lT3q93Wu1o6x06obs6YneeJRwEAGjQN3Qbg8B3qSwPvYYgL
	OxFw2tA6NFIeZjrrwJ6qglZSbYKBMUHjNLnuyjiFqYavpK/V+mvgnI3BkzhTr8zTiywy2Kl+ZKW
	AV7I8XTQyTb7d4F6Dl48lpmlnq+ht874zYheV+3PVcKzcxYcDOCT9qTHtF/7NufNsOFuHEhSE91
	P6xuX/wroPcuKht+v4V5OTD6MgADZxxZE7mjDfoxHNm1ee7RQekxYli++hcsK1oVkdVMYWHqjhO
	efNHbCky9BG/ynNU78YJEdAuG/Rod66/0TfpNDAcbdTGwV9LY+Xb2knes0KwQ05XxZ/tkR3hEsZ
	gswj7Ke8l/CaLSGTdyveASkaZ0O8dh3+YNTD2YIZ8hUUJDnvNfMMYbsG4rfNj5hNOQz+elYvE9e
	KQIaBZD9wvPYKP64lQu4CfHoSGetp6fCOWE2isRIm1ApLOMqfZkUrahgTiDsHYy58tO5aiq9tTn
	fctgc9VIDoraw==
X-Received: by 2002:a17:90b:4a82:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-395dee5610fmr24191059a91.2.1787546503376;
        Sun, 23 Aug 2026 21:41:43 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a4e5ecsm8584132a91.16.2026.08.23.21.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:41:42 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg KH <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] driver core: avoid klist_remove() on unattached knode_driver
Date: Mon, 24 Aug 2026 12:41:38 +0800
Message-Id: <20260824044138.42965-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In-Reply-To: <DKU2J83B6IX6.2CG1WOB66WC39@kernel.org>
References: <DKU2J83B6IX6.2CG1WOB66WC39@kernel.org>

On Fri, Aug 21, 2026 at 03:54:44AM +0200, Danilo Krummrich wrote:
> usb_driver_claim_interface() is the only callsite in the kernel that
> does set dev->driver without a subsequent device_bind_driver().

Small correction, I think there are a few more. usb_port
(drivers/usb/core/port.c:782) sets dev->driver before device_register(),
and usb_port_driver has no ->match and no ->probe, so it depends entirely
on the __device_attach() dev->driver path to get bound. ccwgroup
(drivers/s390/cio/ccwgroup.c:385) and pata_parport
(drivers/ata/pata_parport/pata_parport.c:515) do the same. So that path
doesn't look USB-claim-specific, and if we ever want to remove it,
usb_port would need a ->match() first.

For the root cause, what about this: in usb_driver_claim_interface(),
when the interface isn't registered yet, just don't set dev->driver --
record the claim on struct usb_interface instead. Then, once the
interface gets added in usb_set_configuration(), bind it explicitly with
device_bind_driver(). That skips ->probe, which is exactly what
usb_audio's claim-now-bind-later needs, and it also attaches
knode_driver so teardown is safe. The __device_attach() path can stay
for w1/ccwgroup/pata_parport.

Does that sound reasonable?
