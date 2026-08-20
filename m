Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7492C1D5CFB
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208972; cv=none; b=iyqCMjcgxY7Su2w1vgmjuQ2DaCHNChAYQyrkA71Eb8OEB8GQDozltKDVk2r2PEvHoK9xKnSglXSupWwHleh35f2YRaupBIKGdLgGKavvuER4GM8A/wWWr64GqM5EDq3/uVM1+zgL+ZVbVy2+VOHUDVxW3gGxtFAKn/8H2d9hKY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208972; c=relaxed/simple;
	bh=xKxXER1QLnt9AaiiPM5WSWAX0uD27DHUOeBFaQxfKM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fXPkSy/89miPIwA6Z0iSXlPn4MHsPOekEPJYBkrpj0pL7fJ4JMGD8HVgwhIGanopKncxjv0ETpgD4im2QIZlZsYlmJBhZQGVrhT/50jpFaiBAKt1PLKd2LAKdJ+okwAsQmg1SYw6F2G3EqKm/coR3Vsi8cAJXKUTNjfVvAoxaqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gODdyX8h; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gODdyX8h"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1041898a12.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2026 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787208971; x=1787813771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKxXER1QLnt9AaiiPM5WSWAX0uD27DHUOeBFaQxfKM4=;
        b=gODdyX8hzpbiDmJZE0Hy0v9rGCxjte9GuyTqXs0XJ75Neq5/uI4AXWcahfaNsMMLPS
         YC/imF/lBNNUuUnZSPT2RSgYtBMoBRlxICKHFUz42EdlkDM8sDusYHEM/b1kI9nttP5F
         YG9nZE4pYpoZLPLZnMMd7ORtfzAcBFx2qhXB0ykvrllqcodKhm7LJ2LvxovIhVSsLA+8
         orDtOAb64GuRuabsmFIFV1/IRz3Kh//qZQwxrGjzdE44x+GIIjoJcxjVH8se/Uc22LFh
         wpZVq5R1Rw4XvSxmFd0RdEQj9JQEUSg6ECKnHTRllICIS5Q4YZhL9Nw0aoqVX1r8xXZG
         bH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208971; x=1787813771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKxXER1QLnt9AaiiPM5WSWAX0uD27DHUOeBFaQxfKM4=;
        b=abIzoDobu3mpsHMmG0aGFD5abmBEgCVoUoboOqxWCBO4XPPJTPtKmmL5OJH0m1Ew/V
         WFAOED+ragMbWIH59rN2giAZhVbWwvSX1XIq20vyN04Jxw/+E12N+ThQC8moAD/SfKfk
         2lBejU9t9QfqCPhu4wcoGL0DA5g5WEBKhxAXWMJnkgiNv5Ol2Mq5DvYROxvOP2bN3qR2
         YzYsWXlHvtducdHSjZashhNb0mZcACc7DkAzWrZYhZgYPxld23s9drAK/vFflICADsAC
         q9LUqdpclK6TCH9oyKPFynAyLLjRZKfesiYrVfdpBOjh9oKaZjRijf5MJhlrqoK98ZHu
         r1uQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMUIxtLQruZNpt54QsP8VtsJWlqKR8K3jwb2wxguhfz7dsvDOWiSMHJ8fZjD9HJx8nJakHuAVZET8=@vger.kernel.org
X-Gm-Message-State: AFuF++nwbkTaf1qWpX3bq1wbme4iHsT9RTbpXUxKM3NPlDtNzHKS5P/i
	NMkinGIT+vGIwwjDVtUOgFQ6KwYnXKBa1qSDlIaY9TbQGxlJ8kzM36qN
X-Gm-Gg: AR+sD13A7o1b39T0m+LTz86kAuIl9UxUC4b4XySlOfEs3h3u2vnZ1+rEBBhn/3erVMb
	TPrYYtM0cfIbAF3LBEf12R/ADMF/2VhAKbd/LqeWygyIVgcAc7ZKs6qljK6RJTOXHFTLhSZ89Cm
	iCz6f4nqjvuDkC3z91f6HOyppjSWk/tpIzcwcHQiJXCioEss5yq5EmQD6lsfoK6p0mvnjk7ZoWj
	eXQLPffwteylUSvTfkvNuWfOrlCnHpYGhGso1diwts6NDU9XKzlRuANXpsgot8StCLI73KvMq/k
	4rI7VgH/yK3SnbI73nOWJJRkwo3tnNQMs5JFsUx/F4QcPimQur/ohM+oErXWzWVedeBZ/Ouqx25
	9JFicrIUbOt5UAkK2dpIRHD3D06ac7twlo0zbn4nRNE1Au+nvypqCRbuPoCzCdt9CV9EDOnyYKT
	mGLFiVAVD1Dvf4hzC/JDw7dDKL5Aj/XLwAIF4uIzatXZcouysXgNNfiLRnA8ZWTtFbhJWz7ZNr/
	i+K2QWehkC2Sw==
X-Received: by 2002:a17:90b:3cc5:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39580f3bcdemr20614021a91.10.1787208970791;
        Wed, 19 Aug 2026 23:56:10 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm22999099eec.16.2026.08.19.23.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:56:10 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: Re: [PATCH v2] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 14:56:06 +0800
Message-Id: <20260820065606.78768-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026082048-malformed-finite-4e61@gregkh>
References: <2026082048-malformed-finite-4e61@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

v1 used klist_node_attached(&dev->p->knode_driver). v1 passed the syzbot
test, but after reviewing the code again I realized klist_node_attached()
isn't really the right check at that level -- it's a raw klist API.
device_is_bound() is what driver core uses to ask whether a device is
bound, and it also handles the NULL dev->p case. So I switched to that
in v2. Nothing else changed.

As for syzbot -- it's just where I find kernel bugs, and it can test my
patches for me. That's all.

Thanks,
Kien
