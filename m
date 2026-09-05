Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E146936A35C
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 14:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616901; cv=none; b=W3DjfYsCCE2GKNSG6QQ24/uqBqRMJAzpZYmxnGbjJcmj1REtKSYU1Yn3UgemxdVkcYbu2d5fmjrCMd9Q/JXw4bcARMJ1uqEHDelTVPzDlOJz4VyCRw12F8meOnDl4ZyCipPTshc89MHFqdbt3mJskPm5KsV+Yylf/tl89wZaWzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616901; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=usIbLKqI/RHX/prWBiNKrM/59vypEjRxHbCs8izSQ6CGA4phwHuZr4ue9TaJy4adjIY+rOL6fB4bZv9rlsOuwVDJf7rQdfWzdNLrOPx2k79KmAAZTN3HHUMQ+2B2YZSQwn/jJBgWYEl8ZfSxx+bc9h9DLSVyzQehvTnji2RKEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZpV17zU; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZpV17zU"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1133146241.2
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616883; x=1789221683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=MZpV17zU6O8ZzOYCM6mSh6Pc5bMWELB+jnQuQi5HQCi6EKwnfgmZ0AEBpaSpAQDW8S
         16IVmCmWPcQCQ7FUoAc2mjdXI6Vun4CESOtgp7TZ/BbzPL1ysQvKYMFBk+jIWWhuCbdj
         gBI6DgINw00GjdIA9p44lmwqHYK57/id3xwbTs5uCy8v4cZNIxLxiIv0AMx2XLjAnH3C
         Ea+l+j6WgNoLX1w28TuRU6e+lpGdTNOmLFjggreQG9OFR3L71bhcUPSJ4VvBiNxuPuvq
         ddKBGzFKZUmonKqMeFOYYTi1Tw6vtCRVa1cj6NAo3DraG3ex8OCKO8Q8YmVB4pM+sOEV
         hYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616883; x=1789221683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=Ou9VVNFBHs7EPNtBocaNWWvHg0kWV90D+f74og+sy1Nh8tiO3vjjwV7eRqEQf7pr6l
         ufxdG1esFXCgAHj2bzCKBVQUw/EwO4UFcYGbj7a0n3cTs7LnOrx7Eo3YfIXSGHxWBFog
         izdyytWTgKWlC2b5Yll+cvGlXX+tUQcYF7jdFwE1GmlrJ0LDevL4s114sdjDWLT7MchM
         1EXeI1jNTWEh7n0qZGcsLd3bKpKesY2qiU9G/6WjFU1Omsxrf4GWyyRLJ/wWxRUHLcV8
         Uf1BliHAt7MPsQ8kXTpx3F9cpvvj3KqLmg857ZuLEPStAwPuOPQqLWZM7rT7LTL/RHyh
         RoPg==
X-Forwarded-Encrypted: i=1; AKwUvBwchxusmx/caVv0uIBYZKBcJ6HGt55ZY+Ek13wDQj9f6t9ZAfrZgTwoKi0MaxnRkYsJvaTeLRJaNUc=@vger.kernel.org
X-Gm-Message-State: AFuF++m59wGxV4V9YTUvxO4BbZRkfN2lvaxo3yEoQV2m+m6xuHgNKJ7h
	H8G9cOHjvWxvqMfkVp0AGir2q3vJex8C1csnqLQTT/pr/ET5iwsrz407
X-Gm-Gg: AYBFou22Auu/zB1qQVg7BDGHof5PFZ7/YgamQdb3TDd16YAwakYAz4xbA8XBaoY6QL0
	TOtsWWXZOZPp4yPNyeRpLeLJctQC28scISsMERay+Tfx/gR8uoFz2/nLw703jej7TOirhTvRvE8
	AOH/ykioUxJLwBvsTcKvMhB7DUrkYE6Z5uPpurwFL1ZZwW39jtjcrzjDM8bxvzuBy5Usemo1igq
	IEYOm0lKoL5c7akWzYcYiVVoL8k7ffgoNx9GGPEe9WmUSot4MS6MLCGWx+ZAGGvBe7niQrI80FG
	7qLDk/o7tdrfkucrwT2HnESY9ijS9eB6PvVaj22GHG6y8FgFViqJPNQTGy/EX/z49O5N40/cOGA
	hx0xxc6kRwJZAhK9+oPVx5ll/zW2hgOWbMyDvypx19OS54TsNTAe7SlDpeDf47w/WxwlH7TAmux
	JqXwGm8lXthfJN2gKGIiekOjBpJBq+0ABGG4h+0YqcNy7CGcl6lFDuxn+J0XcZstOMoEwZkX0gX
	1JpcDrutPaoKdoOZqU8RvhygVEKV68u
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr5213627137.7.1788616882765;
        Sat, 05 Sep 2026 07:01:22 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:20 -0700 (PDT)
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
Subject: [PATCH v11 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 11:01:11 -0300
Message-ID: <20260905140113.21638-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

