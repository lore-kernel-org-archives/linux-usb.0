Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC03ED5BB
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788807270; cv=none; b=Tmfr1f+GdeBX1sUgjjQ6wgRzLzf3RLZzp/nfJQuATRN/J8Izy7tuVPREtygKQBVV7yOUvSEp+G88NhaYJqOyYieLaR60Gcu9P8kIUkf8Z9aNiXhJKKhdFjNME1QbBCMqSgV4YayjcAbYUzLbCl/oisKBz38ZzgJQjZfeFYTUZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788807270; c=relaxed/simple;
	bh=i/QWSMozynqryjWo/KOuPiAM0mDpRUXW8SIwUc1XYZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sgARkgohMAbA5K1jFVURDx6YoIcCtp7cwVrmz6bgxap5yk2/GqCY1sI1tiNUnu2zPuiYmu7aE3exDb0fFU5fqfXEZMptTBBeP7W6TGmORS5sbKMS2Ak6JZLOihFWHqVL9VcKj1oK5KcEBS0Vj2MuUc69jUxZG+oYnOSaXoVAln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqAc19zs; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqAc19zs"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso36519195e9.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 11:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788807264; x=1789412064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/QWSMozynqryjWo/KOuPiAM0mDpRUXW8SIwUc1XYZQ=;
        b=dqAc19zsd6MKYWD7s6Gywe8uw+ikai1be+/x+g6YUL+Lihse5eEllxe2JzfTaKX9QK
         OVoBxKXdpYYc4X0rN83JIVFwVibAFknrTTsnmPn+7Wybsz/It7fHlYeI1HSUgR4LU/CB
         BBPXjz4PXmHgNWXkYm/K1YbuN6JUGcUt0pfDyylyS5SK9AOBq5W/o4T8OarU+YRHlVk+
         ci3UFRX9nnLICxFfF1LEU3OtlxjsW0f34cU2IMLvmgpuPn05Kfmj65rmQvLqnDUVVf18
         zGksrEF1mCbdkVdxUAltrWt0c3fHn86J7VjXbPGWGiLOuTnmqyVEBvZqoCc8furtz8xV
         Roww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788807264; x=1789412064;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/QWSMozynqryjWo/KOuPiAM0mDpRUXW8SIwUc1XYZQ=;
        b=XosjaOdAlzJ23si0k9o4FD7IZ/LPDMDoKb1CSmN4eFQ+53gzyAGUyMQQnzzXqiyGqI
         RHn4XQwBhhkqIato0s/wQxWCW71zuH9vguY70cdCNgFfyDxk0gkqAk25EXR6dE+H4Rvc
         vTZ/epaIrzZtUUEH9dL6OQFDSOf3ijQWFW1PZBFI2vM/Ou7V1wshHt90wnoJcqv9Ye4P
         u2CyNZ3EDlArtOroEQc3OSVzt2Tn/asdmREDHK0yeXYc7uYsbrzqGGleyRIwv4brFlmx
         kg5cwBQJNiivkqgV6qG523ztHSrSEewfqRX8UmK+N8o6YU/gZT//3Nu2soVirRq+S1Nx
         0UEg==
X-Forwarded-Encrypted: i=1; AKwUvBw7QQybs9KRs9pGLyVW1a4IZJ0H6ChA3aqtruLEc8pxitjCF9Z4nr2+5FRfA+NiOGjjzAcAviDcOcU=@vger.kernel.org
X-Gm-Message-State: AFuF++muoHVUWlSGBPtKWBIGi1HyCUOjEHUtm9UDxzMFhLlxIt+yK3N/
	WlMIqAdnoXxP5iDV2UEedhEidLtdCJBR6eNV+iiUWGLikNkxktOv4PNw
X-Gm-Gg: AYBFou1aLzT0ZOgmx6uS6OaUTzpt4B6mdtcKMaU6j6cVRZ4lFsfVU/Fxb9C25gaLY/m
	aO4l4SU/egTOniNsINxMcuWRmtN5OKcbgzDsOWt4dbbGVQPsKkXOUIo+Ao+yMN2Awb2BxkWeem9
	b0ILt1M2KqaRvIauS2I+g8NtBmZWcUkC524MU2tAupifA0D83HoIbAtH3DYOwG3ltaqhAJPhYox
	kzDZytT8TIkh3FcKGAWYDykDiTDQSv+M8rw+pUdlLKlEiR5U2FyOU/t+SPLS/ViI1iCIgPJDa6g
	xy/UPkso5ElcwdGOBiGjvcXRCgU0Z6zamsu0sBZi5s9Q8YcciITnZG/zC8pK1MCZOBYEjV90+da
	JQQ62E/e8FrxWJCWDTRWIeI1na2Cii6yB+I+hKEPHit+Za50hxvm4IQQEXCKWgfE3WDRiwwAn7A
	R8yU1vmxWlcdGTpwwGsLavQNbJwR4HXpypWloWpTW8zFprCK6UfG2J8jpxBA==
X-Received: by 2002:a05:600c:628c:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49d17a8745bmr21185385e9.12.1788807263643;
        Mon, 07 Sep 2026 11:54:23 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00031c95sm295060555e9.11.2026.09.07.11.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:54:23 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: oneukum@suse.com
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: Re: [PATCH net v2] usbnet: fix smp_processor_id() use in preemptible context
Date: Mon,  7 Sep 2026 21:52:20 +0300
Message-ID: <20260907185408.660755-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
References: <6e0dbfed-cadd-4274-8165-886725413d0f@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Oliver,

Thank you for the review. You are right.

I used local_irq_save()/restore() thinking that softirq writers could
race on tstats. After checking the tstats update paths, I agreed that
preemption protection is sufficient for these accesses.


I will send v3 using preempt_disable()/preempt_enable() as suggested.

Best regards,

Ömer Mete Kaya
