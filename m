Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4D4420473
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 13:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971749; cv=none; b=IvFAANr9Xoub1F/Rz6EABjSksnTK5G2g3g5o2WZoVafMMewHWycqBf7/YyIo33KqJxE1sWQ6CTVFGqjmAZKArfHdmSnvtbnmMmnJnwt7EkIr8YpRhtmIuN7mL/CmrfUBmyQNOSyVWMEyBQ5+2eF8bHBUHxBi8TPqi69Wb+jYAaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971749; c=relaxed/simple;
	bh=gwe8RvO9NLk/ZagXX1GC3BDr2ntra7FrFYCED0PFHUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Suts+CtqHW0dC1D5PubovFXsMlz60+4aX4TBFqX7Fm11mUN10By8/+OIFDVKuiUxn32tB8/61CaRZGjvWGn0SZFBmRkmIyj2TG8Bz0ro0P9De0wyaMjc1P4FAJccijNoMTMu91sAXC3KPSRVEU+/Kw2AZfx048UzKwcbf3btKG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPQyC+f6; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPQyC+f6"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso2051990a12.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 06:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786971746; x=1787576546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXT4SFBtQg22RyD5ruYR6gzf+jPT9w6tFja2gCIjnhw=;
        b=QPQyC+f6DHrYUrwzhe8FJMsG6tvNkmcPvNWHDA7IO+CWf2STwByVBmG4S4LMPkWfuu
         8Mm3pvnr9UpMGqQt3VhNcrYwDWXKWU11UBhHCEmNDEvdU1fmby3FQqN7nRZpsE9cwcq2
         EF+CrSK8Ib1G5SC14KeXTtU84w2D7uud9YxctLPysKh9FFBROm5iqEuuriad7GtzPn15
         g9ex2cY3lYnA9tGMcCZBBKO14uYJ0/o9MpVBV1EqSmGkOdPXRBMdTufdYKlaRoYUk9UW
         kDbDP4q3e/z+sn0mMbq5YsX64OBCOPqkGVRr7aLVuCRFhQusRhoIL2ey0kJ+b4uyU3Zn
         msKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971746; x=1787576546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wXT4SFBtQg22RyD5ruYR6gzf+jPT9w6tFja2gCIjnhw=;
        b=hYxlrZ6tSijKyk8QXSWepusBWyC4ENw8+kQSxDpNxmMkElFJecxCshSq5PD6l84EXT
         Lcbp1tUYicUQKztPJpOYM3YxB4TGFq9AQxr/bHvKAU66GVz0MnskBYVDyBt9UdDfQOfr
         3ZQfSkAPu+0JWEspVI8yE5ANZ8cNPNlP4DqQ7wDHY6rzk/xsuYffuFY8/7Io5So6qsei
         htE4G3g03eLczRfWs6Vv1fHiONVkjvMFQcs6If2qj9xF7GPV4/Wj/TgXk2QYzuFCbLLX
         Ez4QkhLJaU7YXxdig0KBb9xJoyPorYzPkf043XeX0NyrL/uxoPnwfitpkJLFCzCekxJY
         LW1A==
X-Forwarded-Encrypted: i=1; AHgh+RoVm10wEMzpUblCBjKVz+49CU6vQ7hZBbyXiIn859Wz4dw/4FjDl9uqNNZsSSCE0pseJcF0ZaLr1ao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh6BjWsKq4EAcp7zh990UPIcMN66Eg1CPQAuy+elixJ4NEsEpV
	SRtw5UyOREmXr/8oZI/Ks84M2L2Uk8KKZQT9nSH0ATrASVOMgypNDokq
X-Gm-Gg: AR+sD12yB5mnQawKAeF8yN+Lrc947nhJ5qo4HcWX6EeibAOx3isKEZyX9je35SZSXR8
	z9cLZLyJOkb+uLvQ9IjGI7GDZn/ooY/R/VIPvHM3xuEnxLFVfLcudgxKxaG/8UUz0rCNYfoEagJ
	gstRRM0zSBLNqSUjuqvvLEijMqX5brwGURxOR6XABiF9yTVi4kjllQhbUSVb6aNUrBBO0IvAm+6
	k8qv7m/uK8C2i1RBZLhoc5u5hvYazJZ6fgTCdO8j452Asjexos0AKGTBQawCKg7UFmU6/Z4OaiQ
	Q+YB++lC6Owy4DKv463vjF0YlHIUvlDu24DCO2bGJW3w+Uecmz0CZqTDqlanif2RJd8IaUrwKhg
	zCcaRGpjU/GQ77qKlfWwuw5NQb4PXA5GPIG2KEhX6iYjZL7vokVsimdqsnFnVeDbo47j6WZYVLk
	sexb0E07k2K+Y9JSYYbP2xA9luctcCkoJOXGJ5vQUi7dzYWVHo2EwB/STd/+A7PoCDKmw9BOAy3
	ijJ/g==
X-Received: by 2002:a05:6a20:4324:b0:3c4:3672:ba6 with SMTP id adf61e73a8af0-3cc71caa469mr27110343637.22.1786971745929;
        Mon, 17 Aug 2026 06:02:25 -0700 (PDT)
Received: from Default ([2409:40f4:103f:ca54:3a70:ebd6:25c9:29fd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c385ec7sm5752812eec.20.2026.08.17.06.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:02:25 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	felipe.balbi@linux.intel.com,
	jeffinphilip14@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
Date: Mon, 17 Aug 2026 18:32:08 +0530
Message-ID: <20260817130208.17219-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026081701-glitzy-hush-b284@gregkh>
References: <2026081701-glitzy-hush-b284@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Aug 2026 13:10:27 +0200, Greg KH wrote:
>But that is probably a bad idea, right?  Shouldn't we fix that error
>first?

Thanks for the review. Don't quite understand what I need to fix here
(respectfully), should we harden the buffhds null check to include 
ZERO_SIZE_PTRs too, something like this should suffice?:

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 640d3bcb7bf0..98643d53cc7a 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2747,11 +2747,11 @@ int fsg_common_set_num_buffers(struct fsg_common *common, unsigned int n)
 	struct fsg_buffhd *bh, *buffhds;
 	int i;
  
 	buffhds = kzalloc_objs(*buffhds, n);
-	if (!buffhds)
+	if (ZERO_OR_NULL_PTR(buffhds))
 		return -ENOMEM;
 
 	/* Data buffers cyclic list */

Thanks,
Jeffin.
