Received: from mail-pj2-f32.google.com (mail-pj2-f32.google.com [74.125.227.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552A3D9672
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 06:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789887226; cv=none; b=pUftH9qj706oYmx0Wj9Vn0VkxLC3GjTcsxM/PbutiTHbkQ4zaxc0wO5CkDpTKbOVJvliDGZsMFrN3rNTS6gr5IvgGHLJij55W7VXjJFmjoKl1wzCz5lpWnHqJd4k09lePzApoYHwBWmq7LLpnHt3Aaex9AkZTEBXZZzk5+z89nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789887226; c=relaxed/simple;
	bh=DuDZSD0XqCu2Mvap7vNOAj3dgSNFUKZHYo7DpbnFTAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDx4DBFQ/xlwxDSOEdl17sim9vzqZF5JfZ8K1DiwX8GtrQ+OG/sZPw+lPxDA84qdS9R0Ce0lgQqRRyv8uo/GpGwmQc1Ax15/uUQbJNlVzQ8M6Y/OKBuvxYk3YR4RFc+AFmI/Oau2GNQVAEL3aahmJOlcJv+Ugd7p5CRCfGQkJ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAq/uUIG; arc=none smtp.client-ip=74.125.227.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAq/uUIG"
Received: by mail-pj2-f32.google.com with SMTP id d9443c01a7336-2d747f05ffdso14627335ad.1
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 23:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789887224; x=1790492024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuDZSD0XqCu2Mvap7vNOAj3dgSNFUKZHYo7DpbnFTAY=;
        b=FAq/uUIGkNHWEdLttX19mcV7zrPs2jqA4x2IDvONeIzdqRTeV5g5DSDpoAD2K6hKcT
         Aw7eYt3XQo8lHAUB2lqzA7fxOF6jqwwqIHlvSWi0t19jhNzE/BUX5URVVj8tzp/xzbmR
         Mf1bcdEd+cufVmHLEgXcGRf3fkvX3VzC7PWF+hjDBgxzYHqW/Nn1INroEumTllGPs7nS
         KLyhreous7FFST1U4Cw2mHU7FEa0+a8wijnOibZkrv1s68/ZO8nPFITSO1Pz0BhS86jC
         7a3J1tWiq02NypXLF4Z8FlGal1veYsmew+alRh4d1/9IxBzOaG9sWREaIbV0MLvSqFgv
         JJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789887224; x=1790492024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DuDZSD0XqCu2Mvap7vNOAj3dgSNFUKZHYo7DpbnFTAY=;
        b=Lz0GRwYMYvS4p12rozSTsEhR2V7PI7JEZ58bzrZDVKjYScBsFJVl5TkfcWdSpEYk0f
         r2Oq0Su86NUSfHJQ9s56X0uhU1TBUo18RyCA+1Oc+VhwfEYZce2uoSzFyHms3foipZLD
         21zeYMG/MJ/qqXVltLS6jfdTEyn/lmDC+STqEn9VkifcAbVpkQVnN/e1M38+/cI/NsQP
         lu3xCHtvnAAbhxKs5IU22792rV29XzfgNkXjA73Elz5zTKqXJDAXXPZVyPueZOMrp/00
         46MG3+8AtDkpiAlBDNIWuqURG4OhSbhgJckkZc+a8cbzABc8wfUhVb6pD457dq1G28mE
         DdHQ==
X-Forwarded-Encrypted: i=1; AKwUvByL121elEASaXurjm9KzL7eyz7b3o7Hs8gWdLUybbH8GtbfehdzUGEnQs7YHvzXZzA4VlBuM+dJ/1o=@vger.kernel.org
X-Gm-Message-State: AFuF++nJXzEQKmMW7SPznsPtLGFXnp9/Q3IOuyazNHu9o0vODPUhpRbc
	b2cQ2UlV1ljSyq5C+adw+Nxt6QH0VfsAh2G+HKMP805Go2PG38nD7QnQ
X-Gm-Gg: AYBFou07BJ04DelW3B4NKcHU8fo9sVECXRu8YoF+8SHuG1Do90FAV5jtktLLba0gyPh
	J03/MUCPDxsG3L2noxu0sx1Jw3Zeti1HA3usjbzkpbr4jFzzTH7PZzTUhts5AOVroCy9AJv9U8n
	QWzJzY4qhNuE3prBp/cv0gJ6wavlNdfg1VyK0oNc1j6Q8kHCOdYhfeq/Zoum7uxvVpgf7yG3iOg
	evi0sxJBNXUym7NKL0eovSw9Yb75J2CuqdE+eaVMoPxTwzo04luTmXcMTW+CcusJDaz/mrgL8pa
	MYFmyML77uY5H4gocxrBP3EZeXw+w3jsp1AiJJZ8bbJn94izZYJ7SUK5KZtkrr2YN40dneybsWW
	0QzFKCmm9fg5yN1cSe3KBXqfeUHPklfw8fu3mE8U8vxiYSKp2aT06RgQTholxwmjfbUWCU/HbdD
	qNeS/0xD6Pvew0p77TeGK7z5EbjBMxQcanmsYfYFkduKz3J7HSIVmQBrsUIa1CeN8=
X-Received: by 2002:a17:903:1a8d:b0:2dd:c100:80b9 with SMTP id d9443c01a7336-2ddc100816fmr59583595ad.52.1789887224050;
        Sat, 19 Sep 2026 23:53:44 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179ddbdsm17296615ad.35.2026.09.19.23.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 23:53:43 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: xu.yang_2@nxp.com,
	hataegu0826@gmail.com,
	christophe.jaillet@wanadoo.fr,
	Frank.Li@nxp.com,
	kees@kernel.org,
	felipe.balbi@linux.intel.com,
	ruslan.bilovol@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liuc63@xiaopeng.com,
	liuwb@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd
Date: Sun, 20 Sep 2026 00:53:39 -0600
Message-ID: <20260920065339.52062-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917081832.187957-1-liuc63@xiaopeng.com>
References: <20260917081832.187957-1-liuc63@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 17, 2026 at 08:18:44 AM UTC, Liu Chao wrote:
> Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
> Cc: stable@vger.kernel.org
> Reviewed-by: Weibin Liu <liuwb@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

d355339eecd9 is just a file rename. The actual origin is c47d7b09891a
("USB: audio: add USB audio class definitions", 2009-06-03), which
added struct usb_audio_control with data[5] and these two functions
unbounded in the same commit. That's the tag to use.

Fix itself is correct, I'll add Reviewed-by once it's reposted with
the right tag.

ivy
