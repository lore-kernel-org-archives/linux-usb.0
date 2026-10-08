Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509C3A48ED
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490777; cv=none; b=ZzN1WyoH3UcuI8Q9bEl2HLxCvwSPFwa/TbA3kAvTICY62wppUhvANCjDfb/1SaEZYB975SLwAlLtU65ojuWfqqhciYlUaqE+0PCc4gHlCnilOCzp+sg2ab1H051e9oMMREGaItjTm3YBJhGhhbwO/jEu0AOzNEtaMXfvosvHkXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490777; c=relaxed/simple;
	bh=V4nGewSKdUX/A09r8ENbXyQsI9uD5wAzJQm7heOTQ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnpuAyte9vX58eR84Lwmr2xx43zt/gsB6a+2dUshlGDxtp/hfSsEYwoYI6PzQgZO2LtnzcZmLdiBJd3sxa31pVUWN3cxhMkloOv9ZAUahQ/BAHMknqF6XFwudqCKxX2Y8g3bK2KgLhUFWxL2mvR7p3csEQDS094kg01eKh+H0WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7SO1PbT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7SO1PbT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so24875395e9.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791490775; x=1792095575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4nGewSKdUX/A09r8ENbXyQsI9uD5wAzJQm7heOTQ6w=;
        b=g7SO1PbTc44sStm/PmJeOrT3oEkBhNAchBDgP06iFthOpQyZWayzaMJuX8jeHXzw9L
         aZ2t/JMZGYre4G+BtBnF6Rc3zwl8L43hPn9QIAsw5FayI/+67s3wnJkUIE72W5NNJyXN
         sv827OlJFCvmcT2z5m83iju+OAg7tQDlql1Ri6Z4iokkzv4JjSUEwUk2q0SmpkpiLmCt
         iqTiiBXOoT04as47ExEIUKP0GDAVZXKBCEUvPJ0QVre9Yh8lEbijVVbN9gQz6254qIvu
         RHE+BuQlSnVxb8WMsWgjlveLJoXvT8fE5NAp+vJ2M9cKkog96QGPfDc7W81yUZ27mYXU
         ioDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791490775; x=1792095575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V4nGewSKdUX/A09r8ENbXyQsI9uD5wAzJQm7heOTQ6w=;
        b=t/XOsl57uOnJFdGqrMlkk4qPfqxIPZJ3C4zwk4Y0mwbsKs4ct/mm/oKXo5IHDkyK8K
         v6gem2L+TFosm12h/DsC8/xqoB4s4s8IWL+2e9EPRCul8Vu01VPzGJD0NCYzuJZq1TpC
         1eRK4L9imLoPdNA27pI3LvcnbZm5Nq5t7G3xRS2JjZebHqjbJLmPT1jjctF/ThzQCmvP
         B+K1JmYplsga/D+iYihbvDjhZD0I9sm36Q6uE+2979Yjm7Y0soUTUR3w2oxQorJSjX1R
         KIBza8JQ9v3EyqSOjkUiFh047g+ftVCML9ARVIbHr9b46IOxuee5yXOjD30wg8Ppk+bt
         7YLA==
X-Gm-Message-State: AFuF++nS/1aLFgyBlOiYCnz/A6tE8z1z3KaneJyvZNXgBJJiE5c2irbO
	0bhHK6frvmjcCRvnTA7sZC15QUGQelue28v7npGabBExWJkjJ5JXN9K1
X-Gm-Gg: AYBFou3oL379xL1q9rpIT9e+EQvVQ+rezSyZsSzlBb+39sPwIUj0fMl2dUVBv69uLtQ
	PMBrtY4GsiVosMczCuZ3x46Hw4GUG2EmxbjgLR2PwPYT9/r0PyUzh8iNuNrPHTjHWr2QDLCCCAW
	o0eV96fGo4iUJn/FFhCXPb+j8oLLNijXpb9AV+vxAtIseHQg04LLQZ9Zi8ZUhVmrULY1aCI8PiR
	ve1LmD3F2xuyBUnOUBvSM3wZODZV6D2R32GzamUtpGt0DwJZyufV/NWGQKheHCeCFfgsgYBsAvl
	P550dohdmqDrpeDHzIkz0mjB/FA5hEaET5k5DCIqazvbw7imwzLPztHaM8f4r9vHbYa3mcimt9z
	k03kXPH1fS2IpTep5CE7MoWr8YKwzXjL4gmEvzOmH9yQsBR1DKp1yI7dSAEeKe4JSrAy+02palp
	XEjhAKKDLIB9/j93OkIo/WNA9g20vwgP51jd96A37A93+fDXSRs69bvMPxuSgcDSNVHM1N+AqFW
	7d2ktTvQP6aPdCfHgZIMsHJw1E=
X-Received: by 2002:a05:600c:4688:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18042a422mr121557365e9.22.1791490774492;
        Thu, 08 Oct 2026 13:19:34 -0700 (PDT)
Received: from darkstar.tail74c586.ts.net ([217.201.94.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm10384275e9.9.2026.10.08.13.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 13:19:34 -0700 (PDT)
From: Luca Cecchi <luca.cecchi.info@gmail.com>
To: oneukum@suse.com
Cc: linux-usb@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	stern@rowland.harvard.edu,
	Luca Cecchi <luca.cecchi.info@gmail.com>
Subject: Re: [PATCH v2 1/2] usb: uas: implement .change_queue_depth to allow per-device queue depth override
Date: Thu,  8 Oct 2026 22:19:20 +0200
Message-ID: <20261008201920.40700-1-luca.cecchi.info@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <07d145c7-08a2-44ee-ac00-46535e0ca9e9@rowland.harvard.edu>
References: <20261008112645.1820678-1-luca.cecchi.info@gmail.com> <20261008122604.1862534-1-luca.cecchi.info@gmail.com> <07d145c7-08a2-44ee-ac00-46535e0ca9e9@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Oliver, Alan,

(Resending in plain text - my previous reply went out as HTML and got bounced
by the list software. Apologies for the noise if it reaches you twice.)

Quick status update before sending v3. Both pending items are already fixed
locally: dropped the qdepth-guard per Oliver's note (that's a separate general
issue, not something this patch should carry a workaround for), and trimmed
the comment per Alan's feedback.

While re-validating today, something changed the picture: repeating our
original load test (the one that found the safe queue-depth threshold)
against the exact same Lexar ES3 unit, but now also on Windows with a
completely different driver stack (UASPStor, not Linux's uas), reproduces the
same command-timeout/reset behavior we'd previously only seen on Linux. Since
the physical drive/bridge is the only thing in common between the two
reproductions, this points to the test unit itself having degraded since our
first round of testing on Oct 4, rather than anything in the driver or the
patch.

We'd rather not send v3 until we can re-validate it properly, which isn't
meaningful right now if the hardware itself is behaving inconsistently. We'll
follow up once we've sorted out whether this drive is still usable for
testing - hopefully it hasn't given up on us for good.

Thanks again for the time and the careful feedback on this, it's genuinely
appreciated.

Luca
