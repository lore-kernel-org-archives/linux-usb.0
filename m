Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F92493646
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546787; cv=none; b=kCukWcGp1+vPzzF3PopibDZ0lDYwXfPp3iKBQCR82uu5yrlY+IwT6cOgMMmU4WQbtgwYTLOxxNoONiNs5hMb6KjxElmSXP+wQscQFmZ/zQAi4fh8O9biaj/9AA36TjdDfBLbaFGnpWKn6RPQDUqWnfFApvd+DwU2/Lzaweig0yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546787; c=relaxed/simple;
	bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WQ/9ri1TRyTitJojs3qAnCNMiDDI22pbozdNddx9L92aV4wQrX784no+1w+zjddRbr3czsZw+tyZixcFbyaqVVI+6OmyB0trcsY0Nfa+PN1GV9EnUptIp5LTyBUGiglO5oMosdYvGdhA1qkrWmcvTgTU8a5vZyAF0Ui2KnulHaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfMPrd/O; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfMPrd/O"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3365850a91.1
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787546785; x=1788151585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
        b=BfMPrd/OIuxcvoPVy4LOO/wwdmEo+PzPOJ1+1n1+mo30ADeE64jImWlDXDbbcmI/SR
         sejGXtvTbngWHlr45OHn9ghM1qO205ro0vmV+Vi8Je1X6xL4WJ9HNLssraB3vxIMroUT
         9UEHfL9SeEfZwg8Zu7uzFLa9W1KYeVjqGQV5659aRPRGnIMxbnsbS/RK8mS0gCujCn9h
         9IFNRFvFkiWrseqGfwb4opn+sHy0mmS0RP9+UngFwSBrT2Ewloo7+oGDFTU6mqTGuBr4
         02lYv88jE4xdJT1dBl+JRNB0f7R0Eu3cqDcKxjGT0GKmgrAOg2+EEUF5gL2SBHb8DmnF
         qBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787546785; x=1788151585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qp/Qo50gT+ULoYvMdbBWvICXZmTPOc/Gxpuj7vBLL2A=;
        b=El2AsdsD5DGELj5K9T4k6yAbz6vNkAXANgnSQZi4F/XrWidDm37xEypecQdg3XSrMo
         jTWkYc7iqjzZnbcZnpm8MeDJKPf7yRZluE1RpWqP/cZTkvAREfjAl+z1sc0mHkvlbeoD
         CiLglXjI6CdMNggJ/qGJohrqU5nHR/MgrPtFTqwYYYIvuhRIz45rpwP3koTRpyelFwNt
         TmlaKw25vUbbgVHNN7XTkxbGFPKkn3IYE+zS5DV8uv0XHJRLfiDcf7InKiVAaE4ox2li
         HlPFVnq1+QjJmeD6OmhxFiB/wwi5EFETyamFoUUW4VCGshoBtpqCyraY1gUm1Dlrx5q0
         2DFg==
X-Gm-Message-State: AFuF++n2qlvKCfm914c9imhkghX30MS3Vk5AzHIaGVxk//r+ypQcaIEa
	qnZJRMNTf/bGueOxcg7oIOog1aHBtoKJE0R0Z0Jvlzwo8CpHWek1dFCCf2++aXkBAdE=
X-Gm-Gg: AR+sD10z3v+3OU+eK3hhMegnCs259bkcLhyClBqFLIU/pV7ePpYmDb+9izJmgFhtDPl
	6htIO9qivtoBHDOz5Cd9Krz4QD7veb7/3do/96A1t9JesTL+EmUFtDeY/9vEr5WDqvLoyoQD8Wq
	u9q1wN4UPX1/hlAuFLo4yBHA7SaSRZW2sJW3A3UiX74LsSbX+pZ6NsGWxVyxtbM76794KDKrzCg
	NaNB8C8gkIdTABBBKUeWLLQPnMpmoats5+OJyWlXnbRqTGNpZuV5xdM2IpibtNBuj1EBqLF/4RI
	4tRgxF1Ee/olMy3N7gm1wOYJ019TC/jt377t46KrsiKDQ+Xg7XUXc70pQm8152Nmsv+Q01RN33T
	tindO/dE0e7CEZgFXPqWeT4BJ97ATLkXRcxX022kkpyD2XVBT/QJqDbD0lAp9FNMPrFZVWgZK3N
	Bdcb11/WnSGmhFgjjiaqxXAOoIEgHyHn2lYQUyNQdd3PLP5VPcY/pi7ZXOvbP9BuP2geY/tTsxi
	GkayF7ifNkIHjFLKgawm925
X-Received: by 2002:a17:90a:fc47:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-395df5e76b5mr30273473a91.16.1787546785169;
        Sun, 23 Aug 2026 21:46:25 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4969fb1sm8353772a91.1.2026.08.23.21.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:46:24 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg KH <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] driver core: avoid klist_remove() on unattached knode_driver
Date: Mon, 24 Aug 2026 12:46:20 +0800
Message-Id: <20260824044620.45013-1-khiemtranzo532001@gmail.com>
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
