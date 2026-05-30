Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BAA1B87C0
	for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 23:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780184073; cv=none; b=itF3oCgohzaYxz3E2kbiULvZYV7Vv/MnAPr//ZUE065UCIGN1W08tKdLgjGGaZhsxSCz+EEODnLEet+shtDNVWiHpVjcV+v39ssaquKBfWPrj4R5pDlyozxtdEwr2/Ku9ffMKMUVZ9heDDmbT9uHQZreFIuPTVrCwETRuvz1r/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780184073; c=relaxed/simple;
	bh=h//xESUa1MgkWxiDsu+m87BaTBO1Q60NvIKhNfOp8e8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bgZ1oa0+UPg9gTqGZeutsM9YmA6qjubg+1P6wYh+IAIka77R8DoIdYxNyIZLtPoJTUN/XpSAL16oQLshHcQLeCAXjK/yeSmdIyWDVXUMPZF1JOdZAxxFcfyYiygEmrnoR7XwZdQ7QoHKHV+xl5qVu2Wjqcbt2Y7RnZvwCleZ1F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oxtaoesx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oxtaoesx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf125989f2so18136545ad.3
        for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 16:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780184071; x=1780788871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=43uuPzbAiukfir5/ZLghcqG1UGX8ZOY556ZE+sM0VCI=;
        b=OxtaoesxTXltN4FO4ErhdEshdSRooYz4toJwjxJDpol1OnNIgyshRaT5eGDNrIMcVy
         TshjUPFh7PBTSNQ3RXfkTFLpBEk2H89BkQVL4cPe9Isas+nzPfw2Hl2d31lOyXdyRUej
         9bQoivrwCzoK5C8l9fIWxqqIEPjkuHzkwGIyq9X2KU8nE0TgCcJzeXziCmdtwySASkIB
         F7cXG9q1+XYOMz3L0MIjxtfp+8/U8RUyLe3gAt9FnVSDYYtWKUGWbbbOsb6gkGSSAoWn
         wdzx3vxOy3yjJgOoEf3XX51fl4ysZfZ5pPr9BCzexT7NZZZYPMy47VpvLOFx0tp3Yt02
         BtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780184071; x=1780788871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43uuPzbAiukfir5/ZLghcqG1UGX8ZOY556ZE+sM0VCI=;
        b=K1v5xmFO0ew8ITcKOh8n2VbLiZIHKaClLdc0bcU079Z2L/MXZAfaJoSswIfz/jjDIk
         ZbDJ+cCUxTnftHeLXEscD3FWaJKZ6cQNQHAdgeQsdNyVfQ/BBz9BBmshzWynLIhxl91m
         rQrDBTr1s7mjbr1Udil12B7YQa3hGebRpk7fZpMvgurXC0oMyUo4iuvwokpRTiSAvAe1
         iyLxq5vK9v0/9H3C01ukXczGr6Gdpc7ebjQ8vTGBff1ow9qn1QnWhpLfTS2jeGkyEpCP
         jTw8yqX5DeAhwbUmacZb5HPoLabGnokL251praUMU+WsS0igGlkfpHqlzhCmP6BOiNS+
         EBZg==
X-Gm-Message-State: AOJu0Ywa6aPsuYa4PD77p07oJS9Zkw8T9twO9GJiKwK9ELTnrFstaiH3
	x/ZB02vNpqSDctET5VlhrND7m/vLO4mSVDar1Uhrp0YposXVmu9BylhWC/Fb94oWwos=
X-Gm-Gg: Acq92OG3bdkBa3+aDaotkeCNON0eIO2s6fMYcFQ+5j66DsfMht+oD0i5XlbVFpj4kOs
	tNMPzO5v+q6Yv7NViG+nQuCv9wJ+oTXQt1mG/AwzPoNEUcz0USTvljhI9LsDizXJjA3+tdf9W62
	nbFzxmJ52qm+lL7jOcG5CE2FFrPM8mZ4Nk7vHzaB7hjImBBNG83zOzjZJxYACrIGOPSKMqWvkI8
	TelXrnaiPnJm9IXdvam91EsFBGQP2VHyCsyuV/gz5wm9LeWQ8TFiVps3wRJGuGDPk1s24PQcL5b
	8vsOzRJgSKZVVNMFVsf/waHKcm69yDqfaDJhpti5wt+aSuSUcwbFijPvJUi8rlKdWZkd1L6gxZb
	MSJcq5qPGL+xjrwE54LHyGs0wFHbSHVj8SVZVGfwjIemHXhUJpqv5knf7BmRbwf77u1jWQoAqIi
	JE+/wXB4eRwf5gNfiBlfuiO3l0kjcOSWWiTSh97u3Tsur+M60hCvjQS4B00O5FB+zJRUrFPlSxj
	QyOb650gFfWXpWzU4kWw93slHYBxLEAc4d54XLCRKCvt/Qi4/jFkV0DH6BsFM3YyuNZXBQOWyaa
	b4S0Z7NABzn6OaDird5hD/xH/xsSzArrfMVn9pWAww3bEYIKFjs2zGm4x5WlSkxk
X-Received: by 2002:a17:902:ecc6:b0:2c0:cb90:1e07 with SMTP id d9443c01a7336-2c0cb902145mr1211055ad.11.1780184071267;
        Sat, 30 May 2026 16:34:31 -0700 (PDT)
Received: from ip-172-31-19-7.ap-southeast-1.compute.internal (ec2-54-179-80-242.ap-southeast-1.compute.amazonaws.com. [54.179.80.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b0019csm60182245ad.45.2026.05.30.16.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 16:34:30 -0700 (PDT)
From: Sardaruddin Syed <ssardaruddin2002@gmail.com>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org,
	Sardaruddin Syed <ssardaruddin2002@gmail.com>
Subject: [PATCH] Documentation: ABI: remove outdated USB power/level removal notice
Date: Sat, 30 May 2026 23:34:07 +0000
Message-ID: <20260530233410.1718-1-ssardaruddin2002@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs power/level interface is still implemented and documented
despite the removal notice stating it would be removed after 2010.

Remove the outdated removal timeline while keeping the deprecation
notice and recommendation to use power/control instead.

Signed-off-by: Sardaruddin Syed <ssardaruddin2002@gmail.com>
---
 Documentation/ABI/obsolete/sysfs-bus-usb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/obsolete/sysfs-bus-usb b/Documentation/ABI/obsolete/sysfs-bus-usb
index bd096d33fbc7..067016e62e11 100644
--- a/Documentation/ABI/obsolete/sysfs-bus-usb
+++ b/Documentation/ABI/obsolete/sysfs-bus-usb
@@ -26,6 +26,6 @@ Description:
 		initializes all non-hub devices in the "on" level.  Some
 		drivers may change this setting when they are bound.
 
-		This file is deprecated and will be removed after 2010.
+		This file is deprecated.
 		Use the power/control file instead; it does exactly the
 		same thing.
-- 
2.43.0

