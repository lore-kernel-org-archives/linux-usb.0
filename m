Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70198434E53
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785417526; cv=none; b=Ot82DgMne60rNUD6PXsPXaNf4W0hDDCSP5P3FI9pI05bxdqKKhcXFJlpROeejRPLPvjLaOzHbgcSiQgF1pc2IGYOGvR7K9FY7tAi5jUVDY/Jc7HAuscptHba4FgVHSC2fMGdewtP7eCeV03SR/MV0D3rFEcFDB9Y1+yCCXww5aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785417526; c=relaxed/simple;
	bh=xyZv2VmTQLPI23xs17apnap01Rqgwa9z+jjUANCkb7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HE9vs3eBHiyO0JCU+mk+4ICqXz7GcZz6UIVUOCfstszb3bqZOhkSBNbvdh2XlL9sOWUEE6bJZCvKHur8wMDnkzY6Uw2Dw0xKP6GQy//8umz8aA3hEDEIqS6KeFg+LEoeceCZVS+cuRo0V5I1zFtbeJEj/TRjjM0XbXQJxi5Ajfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ser6kfmN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ser6kfmN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceaf8a1265so26396825ad.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785417519; x=1786022319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAaQWvcNiNvM0OrKoPcMa7qyZNNUq+voHRPWQFnYeoI=;
        b=ser6kfmNmobBZo/GB1o8oiAUsPDVFeIR+GJldnFK50eQSmNMy6PyrOhWCRNcCkNz6m
         Plx76tr+e+7gStccH3J66ReSDNdicXJDTfCEo21V7Izg/OBP1ldWg0VQUh4huQjwgCtQ
         Vib0hGrIInKurk17r8W5iduGGivsdTU+EnRYfhe6md8zoKIY4H5ae/EjSKeBeKFIlUwB
         OQVXg1qBGkWnt2WxMlIWKZqQf97Ro1DC4Uonjt40sfr0kdO00idkk4tkK9ZlQKcaeTbz
         aPsE5RKh/yAY/0D7/3us8/ztB1yQbsstefiishlq930wt4pIlEbrxKSvXjUCNmBgdfGY
         /o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417519; x=1786022319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAaQWvcNiNvM0OrKoPcMa7qyZNNUq+voHRPWQFnYeoI=;
        b=W2qFhnzvcKYjwvaPwUB9wA9f3sZRuhQ3KgjVtDIzWpPueubee24uwW1D+kqiqcAmdz
         t/MYhsdHNPYs2z/Fv4PhC10scSFBGwIvFglr4ecxoplEInTwvT5GwFoCs8zUpy+eiyh7
         DCl6Ft3eEkMiphWgk0ObsmFoYr7ms3NM22alpHD3NgEZZWK4cAOIGWY3EFh1jswbaII0
         hR+v7UESn7CPRF+PuEx7DpLIDrbRq2rQQIXXBwR7++M725Kz6u4vLakSqnCS/BUWy2/+
         zz3/5aAAfZxjt+pzfGkWa9VozmaG0MlRF7Xfsvx6DECyXwmzU82dpVazZm6K7/bbjO3S
         mNyw==
X-Forwarded-Encrypted: i=1; AHgh+RpNQ1r2LxXHIFj6myfB3dWl5zLUd7zjkKylvV517fv8PL04wkqlHMCxit2a5yzmm8qEI44Q1v+vEIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEyKXvcFiWkKnonW5Q11HWK46x+57FUkPNh2hdFvomXQQjyTNw
	AaFhsbo7A5R8lDt1anBeTUrjrpFQ8S/5pXvkCinYzN0giZ1Ym5lNR9dU
X-Gm-Gg: AR+sD113uRZZ61XyInYagF+RBCh1FYFnozmQuXIvFk+Fp/I18HfpVIvR1It8h6pbDvc
	zfAlVph2U7/p8P34jo0laDe5A4YAjSKDymsAtblR+bX9L4zjcjrhCFG2H3dkH0NK2YlglZglosE
	jgcSFS8zW7wB/+b84WAnYprdHYRm7Dn9F1kkNFRJv3xBR2h3qtsTXi9mFSoPULuJr7SoG1RHmRv
	2XXxd9vF7eqszu5/ZVehC77xVHw5o16LliZAXiCmF/uO7rtJWI4z2gcP38UhOWN1yaWIOij9xJo
	IBJ+7r/XeMhCnjXFMCuKFeBKu3uhnxHCaraOqjcQjVzJB550lFfa/rRIqQDmctphAkwzfkES8OC
	PR2LF31F9B2AmHTw9y1qmMKGu34KSlNGwW8HXGpsU2cdZmr2auvK6qjcQ8bMEPKJeOr2joawZRv
	jKwNo6bxTBmDdpYnEU5LzhraurDZ7cL9Ivh4t3F4UoTq/IzuwAWb8ov7kDNGEHJ1bK
X-Received: by 2002:a17:902:ea0c:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2d035c4b360mr23200275ad.21.1785417519033;
        Thu, 30 Jul 2026 06:18:39 -0700 (PDT)
Received: from Default ([2409:40f4:10f3:2277:aebf:f6c4:d4e2:70b4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm23063328eec.14.2026.07.30.06.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:18:38 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	jeffinphilip14@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	panjunzhong@linux.spacemit.com,
	stable@vger.kernel.org,
	syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com,
	xu.yang_2@nxp.com
Subject: Re: [PATCH v5] usb: gadget: uvc: Fix Null Pointer Dereference in uvcg_video_init()
Date: Thu, 30 Jul 2026 18:48:20 +0530
Message-ID: <20260730131820.9143-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026073005-shadiness-untracked-9efc@gregkh>
References: <2026073005-shadiness-untracked-9efc@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, 
Apologies for the noise and flooding the queue. I understand the situation
and am stepping back.

Thanks,
Jeffin.
