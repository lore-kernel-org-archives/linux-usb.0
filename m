Received: from mail-pz2-f31.google.com (mail-pz2-f31.google.com [74.125.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654623C062D
	for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 19:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538002; cv=none; b=sy6ImjPLT44A6TSOImDwVwMI+9G8+Y6WKjCmRktagytJopsRaPomGuFA48xVF81jwZZuaDYJTkuzKFRCyb7kSejht8s+nhwl8bxaK0h05oE4pxunLvjgIHp9zbOS1qiD099gVdRn1wElwV1jKvKSihmD93mEMNvXezQjaq5WKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538002; c=relaxed/simple;
	bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dU0wuBWpODC5th1N6SWKSqJ3rrig3EVSGEmEqZDGRbsObFRfW06XC6s7PHO8YRo0c5sYJ/bdJ7Qfk+5LiDyZWoYXkGLZRDgg1rgvnhThkFosug0B+iFqgldweIoEYu5YAQeat2oxQdrqJHOznJJPw/QIdX4ENE1pVb6mu1T3Gug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/gsvUH6; arc=none smtp.client-ip=74.125.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/gsvUH6"
Received: by mail-pz2-f31.google.com with SMTP id d2e1a72fcca58-8814e797a5bso438307b3a.0
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2026 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790538001; x=1791142801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=V/gsvUH65f4/MTfHpEyxrxLt7CuC3Nn+xHKvmyHw5u0aKsv7siqAZsonHiNd9uIrld
         vn/6U5u2EcikMRGHOivMrfq9/Vj6IEINAWHGPfO/j0Acn2AxFk3OkXc//ZJBciisHVSQ
         DuzRSmvFzRzw1e+UkN+lXsCEXtKRs/Tx6dRGljlIQVgcjoAjPhN9W9wfXjW7XYFkxr1b
         az2wI5jC0icN5shiG9jVMNT3BscI4l/SUqj2pAw7UXQ7yrK/p3zxK/Xtj09PjuFTV5NO
         k+y+gZ89dZeNPwNU1x9M0mF0DTTEnpisVimOgcYKwEFxvYmqZCjbHPVhsJ7LD6ECLOw6
         3sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790538001; x=1791142801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=KYmrLmSQog6LEibFd6+ei5aO6yic0y4kOWC1ecFrXl7Y69HflPOKTXIY89zA95t0VT
         Kt/y3eTJ6pch0lCb/bdSMtMzp27x2rfb7HhGCpaqBxm1qdoW1zcQsOBlzQ4Q0Yl7kOUd
         GUIpHbxY26e56/zSFR95JeJMHIf/U+CxvnEn0tWHVLTlx2zLZiLKfg+ORnDTlk3MkFUj
         kfSrYo0yS51HtFzpRL7NCsj8oDdpVf0nMZ0dR/1JBmY1db59htaO0/PnkyR6mAjb+5F7
         PCM/g9yKuFdMlVmKq7mWXjco5Pdei4do+OtxwAaUscRiyFdoN/bMLwBTTcMiiE9pY/WD
         tMiA==
X-Forwarded-Encrypted: i=1; AKwUvBxNWPDBG9iWd1a62+9mZRmmSQok7hS+TLhIR5GqE3OfR/Hg5wxI/fn3TxulcZIBgeyxeB4iK1rhV8k=@vger.kernel.org
X-Gm-Message-State: AFuF++lzx0/9B7hg1ppGNxBV9/mjyJ/pdImRGsDyRrHT3OgrOylIdKO0
	YzdeCbrU3m52q5+uui1VEd/BT+mhhQETw8zLScPXSUTUVzyf+oKZgNamlgEMCgup
X-Gm-Gg: AYBFou1nb62Ow1tzn9ExViPqk6rvWE7KGnTRrJ/aS3VZpFqLHFxs9KpP/xt0mKEv/Th
	tmMMKfs6GX2zZdhOp9+igZj5iYgaRvPovQoZ2AjJOaf4YnNNZJFrdTz0cgVDxld9AjhUSFZM/64
	c2jHVQh/DVJcSEzI0fXpPi0u3cBrOChn9imbj73yZhTRPAknVdDtTMsUz3/VQ/6MzfL9ZxjDklR
	dqmHJUYenpETXJlAs2Rd7jM2iYKz4PZval4CMA+1M97Sa3Q28tuPcNkIg0A2+ibkBn/a4dKL3BF
	Ov5E4fEuwM/uTUkSSnM6Hc3QkkNBy5Phk3pvIG+kpATLIL/9SiOKxkyQ0rWe+jrVT5c++NzsSJX
	F/hQAy+alCmXgseiZqj5/Ix1C1ewI5uAmqdVsoBpdlsjhfEY9N1KphQqO8yeaJqA+amdhwvl3OL
	pcz6xcC60Oje7h6dWpRdqHTGVmcZlv3t1F9uzl7hgSzLv0koyRe5eiHVHBQQyiGMM=
X-Received: by 2002:a05:6a20:d707:b0:3dd:a197:cf25 with SMTP id adf61e73a8af0-3de0e9185e1mr10431840637.73.1790538000543;
        Sun, 27 Sep 2026 12:40:00 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::a891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-882585621d6sm969652b3a.34.2026.09.27.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:40:00 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] usb: ohci-sa1111: remove unused dump_hci_status() debug helper
Date: Sun, 27 Sep 2026 13:39:56 -0600
Message-ID: <20260927193956.219321-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926162513.25268-1-zainaboobacker33@gmail.com>
References: <20260926162513.25268-1-zainaboobacker33@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>

