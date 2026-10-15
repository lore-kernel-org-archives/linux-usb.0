Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB73E5A37
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 03:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036165; cv=none; b=FWaQoyb6IAD+33bLW2dp/QYhuOlgkptiEZJxfh5mTvz57XPiWDKlRWApw7XyhtZZFNWZrJ2qj3W0PoY+USwgB8MdngosZUciErQG6ASbU87tUo7wPejeL0qmotuwrYU+K5ri8b3BygEF72KSsW5c/muGhL6zCK31fPzm3H8z0wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036165; c=relaxed/simple;
	bh=Q+/PZ2OIQCBAov8P81cijscQ/AulPsSIC1Y/v7fM3Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YU8Kdn8+s6aWJ00Jh7GjSzIm0FtaIxwIJjAzGtqIcKj4PHrpGUT/cS24Nxvkt+FdLj9nfLtID3uXNSKce6+vBihxpxVbicQblBuzpW5v0X6BVqsnRCNOjaUWQsZGQZ+zuMr/C2r71pcFVBFNzFyaOFaEBhgZQ80z+gN2epB+/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQmPhXUF; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQmPhXUF"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5350c1b9e0dso12098811cf.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 20:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036159; x=1792640959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENjx/dzeV7EHPywYmHzcSjy4huCWSW2biwgXvwcA4ko=;
        b=GQmPhXUFprhV/HboAKnb289K66V1IcHNyJWX9CmDOPDTRtuuRvYvD+6wP/Xujrkn/K
         xB7ppV33I+TZ0S1wtZXkXoDo+BZEBAvYpnEqvgcFNIbkgrbsdzgH5fL5ZjSbl0TCt2zu
         myhbfv/LW04zsMG47wIdGXzD0MHhTKJQuDZy7am+wqSVwQ4SxxZisy89VdL92P+z3ObP
         WuTbeSI8cea15xAWp5XXXD8V+U1l8vozuMVLnEzCj0DEWXSnlyfAWNVhDPugvgI1SPuJ
         UPy3eBah8bRwPxFFV6Kw8cNXELmeLSyFuYe7QA2VeG8cME4RfdL0DLJtBtOpV05Jz0yh
         xQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036159; x=1792640959;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENjx/dzeV7EHPywYmHzcSjy4huCWSW2biwgXvwcA4ko=;
        b=EdybPCN5z6j23LziPfPw/fj1zm5nqV+4AKRqXwsy9s72IEm1dUY29A1+S0JUjotBG8
         UNCQTbGoi1Km4xU4v7FMhlUOpsR2hp6J7aRcfx5fNH2UPRInRGGnbXHRxI6eH4VkFXz8
         dmI0lk1poK7YeAgUOiyPpZiteh0oTW2cj+O05FkNi0YDrxtEIcJ4/sml2kh6GHePiToO
         YvAPtuhULh0L4CYzkUkfILx+xcLqWfQRQVqpWSSSGRnvRMmKIRq/LveQkhAobTLZigsE
         WcqojKZHwgFQy5vJntWwFZ/kJKtd5GHEMaK6xuTx16rkSzpZrKVTuR3+BsiKFiQaV5Zo
         VZWg==
X-Gm-Message-State: AFq9FYIuup6L/XFnNVYfDjg/Qxc4XtexKyZCwIN45mmw3P5tLCZ45HqL
	JwJldzTvgg0R7+hPw2ZDMMx91ixTP4aBgDlmbBet3947Q3xizA4GMuE=
X-Gm-Gg: AYBFou0p/LxhTrLh3LO69yxoDMw6M6HMqeeNKCV5DVIwfWvzqXwBJCkILM88WXvLEV1
	DAXAVLsL33CSdZjc5qkoZkiV7dmoiEPEOzpgod32vHKA/pZ66V+QEwxGo/TFrGfpArk9PpjhDze
	rSnXNV47E5uOH4lh+J4MwI6zcB0L5QdiUNwb46sRlgjyHV2jUEkJYPLk8cW8Pi55kcRc0yjAn1H
	dQl2fNGjqZA/Cj1RUS441YlqgQ9FzlRHQRln5PjDHDliP/Cq8hC4p43iJNOYhRKWe8Mgo8HCLav
	Cm0jwMmYA1wcVs7dT/Gv4SRMAciXcFWm8dObzj0usQh5ekHp1rj1rrd+1i1bDYIhGi1QWuQ+LMm
	+o8ZMMr632By210pnHRzKQlJvctQT9mfUhR7D/ZQp/cPBl6JlxZe6yIQDIWclnkVMRM5OQcTVJn
	H4DCD6nQGpusuXuv17aG84eBscaKbBWs/8xBMonuUxBNdk6BdG5DAiL0PMPSGNaCB1NcJR+sTq/
	WBgNIHtVr7aASSZhZsmT64za+OIvp7zIn0yYx7NbDlMTRpo04EyxxklJGnHJ7jPcxl3TNCkr2aA
	9bPww+NGJocroeHjG4TSdnU//gCt
X-Received: by 2002:a05:620a:a0c1:10b0:93e:c12c:4415 with SMTP id af79cd13be357-93ec12c4ac9mr2095381285a.81.1792036159449;
        Wed, 14 Oct 2026 20:49:19 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 0/4] usb: gadget: pch_udc: order IRQ and descriptor lifetimes
Date: Wed, 14 Oct 2026 23:49:12 -0400
Message-ID: <20261015034916.2773248-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fixes are part of our ongoing research while reviewing kernel code.

Apply after the published probe-cleanup and VBUS-work patches:
https://lore.kernel.org/all/20260811-pch-v1-1-f79801c1cd91@gmail.com/
https://lore.kernel.org/all/CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com/

1. Drain works and release IRQ handlers before cleanup; establish a final
   controller interrupt mask after the PCI handler has finished.
2. Initialize DMA before IRQ registration; enable bus mastering afterwards.
3. Track successful EP0 mappings and return -EIO on mapping failure.
4. Return the EP0 data descriptor to its owning pool.

Compile-tested only.
