Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380D2406822
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616910; cv=none; b=R2sWzeU4eXKZPsycZzoJxycPOzaicZoh6jzWA0/FOhwvZ4cqetjkduo/c+BzNXYqqy4XSQ/2NQBbYRCPxpTo19kh/ZdvnyXgC2w4Z8zD58OogcplNTzFf8F4bvjoS1Z4eqJuXQ1ibyvjqgJqF+H1Gob8ZYWdPcqPU+ncvVKkyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616910; c=relaxed/simple;
	bh=EizzPFcHBTIh2Y7GKphJQqpoh7RMlGuXmOyHqJPayZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhK2BAvrIVt7636xS+7sz1uk2jFPISTMc9qS6aHyKLB+m95yxbAk2Sf/vtHfB3Y6yBM+X2W7fzKSzgWpT3T6vWALY6wVQ7e78+HX/F1etbtSxZcFO6znt9YmUw46u/TbZFPYOweq3B/nbXQNlvf6zcYOm3fT87TQzU/ymHi0MVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAWHDYpH; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAWHDYpH"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-77bf3334d14so1466386137.1
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 07:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616889; x=1789221689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=ZAWHDYpHOMJ2pb1rznJGqWziVaas9dmvZpinpC8dpdVqj28oQXoc8EcWh4t0vpBJzr
         OfhyVTe5DH/gmR5zTbIvGvTij3vy5znr4MnvveqiDbMkf1FnVpTTGTs6pPzlKhmqp3sz
         3YkwoIj1bZPG4c5xVmHJvjO423C0j8ygBV7y8w96COK+Mrg6bjL66EJZ8f6zhaipTXCA
         shq6D7fnizDyjnuKBYcpdih1sLm8oHZjgJYRBxZorjypAjnKdQNVQabQdDtTPlev5008
         KLDjEmNRmj3wxviz0WV5c0/pYxoL+Vd+BAWA+ZhPGQWWDpR2WZGmObxm4RgatpKhkaDT
         jmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616889; x=1789221689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=Xv4T5omq7mUVbpKzg2u4EC0FzhxQg6Ow7btbOBioV38owjLmg6pM4xKk0r/BZ6sJpY
         3LxCtXntLs8DkH5AUkoJZoYlMedt4Q11Wv/aLqdWzMpvU4XMd47QgjuXeMbEZ7vr1nIN
         Eai9Qo1iNbtT4SNZmY42K3gSZNrz0+EF7EqvTP1nmqX4NDCLzxPHVu+72VnJPLQSacXu
         RTSkaAtxOhk5T0vUhVVZnTnyo8iWeYOzOGsOikaAw3s+zZhU2P1slEu+k0Pp5ioUDjxW
         6D/lm/VpMg+82/6c+x8mdxqJS+iZwlNC7anEmndxWPckXPC1LER13Sg4NXyviaUJe2Zo
         IBxA==
X-Forwarded-Encrypted: i=1; AKwUvByRejc/U9KihhV+/iYgNnomaz4udfvm6f46gfI8O6Wmaf4ugiGv/EETuPnKtHmD4QzUfOAMHFF2qNk=@vger.kernel.org
X-Gm-Message-State: AFuF++kD6rZrL9gjM+ryDMeEngRy85HSd/UZzhh7F923Te8fSriiIFFY
	Ir4MoKd3NjWnaXBzfjVpyuaLjlVmnYwRYIP7FrWhOY7ufTVpsRFEvCQY
X-Gm-Gg: AYBFou0Y+9V0CoRxhifHbV4DijWFCSXJIwxhfC2Y8eArasziCvg8ju7qfKl5Edap7NU
	rY4YofoVBAsXHaJOLBwQFo65dRV7hzM0TgZoPNN72qbnDYT/txqUOQgKAWWG/BsIkP3YtL1ZvzI
	PRfkahgrmRBeAHWJ5kr6v/D5a5ToQMyNm4vTFP/ICNx7tgiGXH14GVl2tGrh6WZg/hI0a+dLj49
	+qUQjFE8LlGldkmQf346Z9j3RgHdLsPP1ko1U2PcorSpcJN9Sh4Gfx7wr4Jyf9JCkIMae8ysz+j
	OANaKdkwSan+50iFc07LIX+2xPPgDFS3qPccJl7/W2V51PknXTYjYvk/QykALydm7NRL8UFK+Z9
	GxEPaGlMHH4kORE0fwSh59Cw2B8wGNYJGYxJpiGz/OOnh/lDj9EqAY7DlOB2dEhc9XdeUNZwUmQ
	9R8LqrUglfb+juGr5zhJi/mAfKnsh67CrgCFW17iTxzF53n3+04HtO63umlHgcQljo04ZmFNKZv
	GZRFyDozAnZ0wYyWUIu2n/8y99gqKv5
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a4a90fdd3mr5362480137.2.1788616888537;
        Sat, 05 Sep 2026 07:01:28 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 11:01:12 -0300
Message-ID: <20260905140113.21638-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..3a0db1be6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316) += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

