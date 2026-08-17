Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE7B448CE4
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982625; cv=none; b=sYOI26AniU1AIdPTsMUgVOqpqA2k2oS1noA6tLYmJTXg86Z61fWwYAoOh+NuA6O0b5jBxNlbXb9+tmKCTp6FRNogNB1wxIQNaQG3R8AB9O5+zYMZHhRgS7XCLt9DmQwShS91xa+XSbKWm/9erRhCqTD7YSlyAuXT1WuFQUSfDds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982625; c=relaxed/simple;
	bh=yguGrGipj1Sr3lM9LirwlqlAubM2+wrNpMoDM1U6p5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VNqvlbSqXQmmIuy81P4c+GdbPFh3EfgxwCr4oXVI+0wuxusoNm8rQ2jiTBqsmdqKrC/Z+cjrqOfhnCKf0o4udZDIV6+oRBFzRL8k4PW6FcKrLFcmeYUcTvkE7JiNAxjlyxpjcHI+pVvkVve9Br21om5tca5GgL04c041oRaC20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRVXyAfh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRVXyAfh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3026787a91.2
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786982616; x=1787587416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eAUOGoRQ+1j0VLJyMKulBFqB6sfqwvkZHzDAzcL4Sc=;
        b=oRVXyAfhw1YQ1MN0B0HFJVplEVhCpIMepbJ9TURT97sFPPU0nd065c/WbFCTkzTzeR
         LlUzq0+pY4aFExfYmYJe9I+GimIKv5GSb8ob+PvynKYPk0tubP5eq76AOTP18jqHb0m1
         WardKUGGlq+F8oEDUcSkgjGDsnvZo7XNw+D2+sT8xGAH7KXRRUk89jGBak2h9tOXr9cy
         OYqKKrwKRgBhOxMhBq2WGmYAueznuv58uIEJJukyd7VmSrwHhxaQ55J9ZH18Fl7taEU3
         Vai0YpMPvWaG8PgOMnme36JssS21ul9vIP8RXadPT4X14QGXEpnc+mRO5D94Sn0gp5ov
         L0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982616; x=1787587416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eAUOGoRQ+1j0VLJyMKulBFqB6sfqwvkZHzDAzcL4Sc=;
        b=qjPGSu7rnFXSw4NhU1K2CazjvfeJ+K2b4wsf3XVR73BcLi85dVfWoPqUqZTJyd/pFt
         nW+M0aWZtcIRoQpdH9nUPSCWxkfAQyLPuobYLy3qId1DKV3WHu41X1PHaKtyxEhB9hBc
         pW1PyPJ7cRurMc0N10kbdaSa8UsnYZFkrwpvyACUMuP5Hx77zHmcB0Oqlo1tNErBc/9K
         bWn8w923HYev3dahiHbs2U8IiOQjjCKTlM8E1ek9zUsntD9Y4L1QfaTG6VVUPXRPS0aG
         36uq2tmF07Al4hRe516q0jum2mCFFEoCKcsnnDeL60EgGeZ/56B/aoraE5Ug6UMYwE4w
         ndDw==
X-Forwarded-Encrypted: i=1; AHgh+RpwBJoLalF8Pn/rXxFkyTS5I76/Z2aUjt75g0qROdpA0RePANr+VL6rRrn5gHiXw7Vvx/V6DemGT2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMq3EXjmkzaJkzt9oXfnrhz1jbwr9r47gB9nDLgUZ207q9827S
	YtlsZrBbSFweYdjbsCbY8HB7bL7Uoaa8oRAaoUz8W3y1jKhA1JSsDgfi
X-Gm-Gg: AR+sD105SUAb135pfNEpG4vl8or5jhRYY5inOCUCQgNMDW7yd8CHfBQcKxR1L/uiu6K
	m+rdY/+wbkfvctlNc5Mcs2BeHcFvDhsxKf1CFxOjOS5KtO0kjv31c4qsofSMYY1UMsff5Bc0PDH
	mAmzhM4KxlJ2/F4X0jJ4lL2qvUNR2J7O9Hx73n9xlhvD8Xvrza2MgDzpROy0xDGPyITs/ThmKxk
	VaO95/iZ9Ffa/+uAyFgi77qlELa8c/j5F2f1bgFtdtGG+TDyp2pc9WQmFaJvOd3D0SukNaZQhis
	pLiRzlUerjKxlvAqIUVLj20thanFUMbRzFUiYrtce+4gIyNC8a4TAY8BoeA3WrUjR7sDsPVIo94
	K1NmiWOfeHxbXd1XUtXIm/5heyFpx5yJYJwzXlQFD5sA6dlYyIc2l+4IciAqn5F714k3L9Y+dQK
	TvCMrmAr3aMLIHD1I5PVZX4y9R+FySgROPU5T5oYmeNqDtHxcehCnRlmyTd2siF6uwKM51Na1uB
	sTy
X-Received: by 2002:a17:90b:528a:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-3933b7c3696mr26862150a91.3.1786982616335;
        Mon, 17 Aug 2026 09:03:36 -0700 (PDT)
Received: from Default ([2409:40f4:103f:ca54:3a70:ebd6:25c9:29fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e31a9dsm5481969a91.4.2026.08.17.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:03:35 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: stern@rowland.harvard.edu
Cc: christophe.jaillet@wanadoo.fr,
	felipe.balbi@linux.intel.com,
	gregkh@linuxfoundation.org,
	jeffinphilip14@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+791be35f1fbcc85d06d7@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: f_mass_storage: fix null pointer dereference in fsg_common_set_num_buffers()
Date: Mon, 17 Aug 2026 21:33:19 +0530
Message-ID: <20260817160319.28251-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e52c5913-9210-47cd-9a97-ab00547f53c4@rowland.harvard.edu>
References: <e52c5913-9210-47cd-9a97-ab00547f53c4@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Aug 2026 10:01:36 -0400, Alan Stern wrote:
>In fe5a6c48fd95 ("usb: gadget: storage: get rid of 
>fsg_num_buffers_validate()"), the code that was changed originally 
>required the number to lie between 2 and 32.  Even 1 was not acceptable.

Kconfig currently sets the limit from 2 to 256 with default as 2. However,
we use that only at build time. So, if we enter during runtime via configfs,
we set page content to 0\0 and get the null pointer dereference. So we will
need to add the check for num < 2 in fsg_opts_num_buffers_store() and return
EINVAL? Upper bound is 256 which is below what kstrtou8() can return anyway.

Thanks,
Jeffin.
