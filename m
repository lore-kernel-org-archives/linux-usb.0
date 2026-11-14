Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633004;
	b=FqwzawICYQBjFATkKcTT1AdTNbtXV0D8UMG6BoOqu9hUqhIJv/d0dOzhe6F5MBaOPXN0
	 KYbiK0pCkAeO4jLq/pcoOxlXxHGtpU9Rchvi6T3Zm8u4aYwWmnkGevWO8kSJBY8NV1cUS
	 1LJSsVDNoc/Co4fDgw5duhdqyiyZfXylJPni2kH9XtLt178U7KTHBH3tUwJMmd3km4V1K
	 +pLT/OSgqCg6ePPlzoJ6yORwCwnxYdVDsmSZKsq6Qo2v/qHhOThV/71AqU6tzeFJ+MLrO
	 Yix14HSaopWGXB4+6fvxNXuwwbN2YjZBeG1D+rDYGwTJKjxwQKiDX3DM//npy6p7scQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rlOJXbpkXDswPdI3nKOzR4eyv+X9y3ctMZnxMuEbz9s=;
	b=wcnmMC4v7oPwmY/oAsheOrDIJpEH+vRncm+rh1WwBAD9iUllMXWwLhA30aWBJoK/5Ab2
	 0UsJWQQtUxSDi1A8S3u4oh0152HdKkHczV4jb7py9linmFusuQk7Z6crikZ/nO7aKrv5f
	 A/fMLPfHCcCg9nzNv49vkQp2fwaUPkc9ZlD19VO3lBBAL6meC9c3TZuRerd2l7a6o/f+L
	 BNy1rrZcywnCCodNrwAztBmyIF8IESbIQcU19ms4FTKAGuuLXh1xEqgOKXc8A8qPK4ka8
	 d/KWxtGAaOn0uxstqqfQElTR+31R6oOlb8xFwGA15mXzvHSTbnxQduOHYvw392ULrng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yP2r083K;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630DC606A887
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 630DC606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yP2r083K
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1409114a91.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632998; x=1795237798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rlOJXbpkXDswPdI3nKOzR4eyv+X9y3ctMZnxMuEbz9s=;
        b=yP2r083KsnreIwGwo6Sdv5GYQ3soYXjX/EyGkNxmuBuS2IciIQPWJUbOLj81xVdsJR
         5b12dtRreqzmon2OhKe48HSa75theHQSLDe6NUBKmBy5PQZATzJTQCpD3BcLpkGNkUE7
         RxF+7gvuYoTKVPsVFDjjw4Qgm7NWbUz+2u/rt2RmblYBJqBHuYZiftaTQl6ZOyvYTTxu
         UjoM6U6omgoUl6rZO7ah4Hv2VB0XkoPKxZqzHdsZxyyLwU2Tsy9pZTYz3BWlrOtgVpFy
         lq07C4PU4lidYzNfZ/ZJN/zzfEa22yap7/Ri78RIsZB2XY7jD+b63ZBrmWRBNOG8AfSW
         MQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632998; x=1795237798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlOJXbpkXDswPdI3nKOzR4eyv+X9y3ctMZnxMuEbz9s=;
        b=rxq6E8GZdfZHPYd7jtZ9W5PvwPVhVy60gLAJCESAJSxOklpZcaBLN9dR/6Dam62dH/
         ugc9S3YlnoUqce92fw7NHtDRFUaC9B4s7qMYziGbLdx7LndqW+nP4xhfdioGGRMtdO6I
         HttnQ5xP1kMWFmPBHgOl5nhEsTiz2p7viNGuaFBMio2XgVC8Uv3XoLy2Qkl5dCFZANcP
         o6MWlAD3V6YXepkzH40ZRY1qPBS29/ERbM5SqJFJoEIsZ5dvymwoF6k7ecD8xDDrgE30
         pbcN5+bS9Jqdu1rjcPCOEhyR2K7FPtTVO7xihaIFA5ex3jJ0QpyG35KEldYmR1Dnbpnm
         wL8Q==
X-Forwarded-Encrypted: i=1; AL+hErFhZaGs/kdqxBzOGmGHaEckdz99g/2XrQwofWa2aVQqnAtcfS8Cw6YoR9SG9W9MAILHtkHag91gTWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NcGVfHIK/YMjVq5NfVci47VFipACMbhnj4b9G2NHxgrgajUgo
	MAXoa/kvM4GFikHAubvVUGOusb2EM1KaKoeIVA1da8VVC//9umn3YCBh
X-Gm-Gg: AYBFou1lTRfY1uzxg8WpTgm8VmTU7WhzlBW/hNnBzimDboKLZj9nRVoTOiTGevoyYNY
	Hv8R3ETDtuCKf+DUJ4pFhWGv5C0cyCTU4ncThORTazJ6TqDxToqC025l6hNuMKY6rS3OprzV4oV
	Hw2BgXpIZqyXt5fxrsXCCzP4TSKzkghs96oq8lE33iEMC6olXC1gb9AmNQ7UIRH6UjyaLj9m5Yi
	iCwfzQoGcJ3TWiKg/0K293/wX+BqeEhqpY99s17yyTq0iH0FxZR+Wvbn9rfRsduMFKWEWn7VMde
	4FVnJRSCCvRHQ2CACxZX2KTQA15jhDqpTzOpDGzNqzqRZpENTf1zCG6ixWKsG2QSSnrdNFjsUzJ
	k8Mov73raj9OLtn0VDrFXQBPuxoWAgjW2Z72g4gnMHzMNZ8S7claJnLI1Ugn8L1i+jXef7Xb5s+
	hUShzSEiEYPilR8lSNcjIAVDD4T2pVmMXYbqdtfpsyF1WRJM/a6uNee7ONGAUHsNn3TtC0cQKhW
	dzVlHN/cr8WqP21nwxjqPySqN57zmJ/578rozpsNu1E52n4DhiL2DOvSOjy942Knrl/IE4E3QBi
	zycRzKBc7BusQPvE541S1Rk7b7NQa+Q=
X-Received: by 2002:a17:90b:254e:b0:3b0:cc3e:68b5 with SMTP id 98e67ed59e1d1-3b1b09f5d74mr4482115a91.21.1794632997703;
        Fri, 13 Nov 2026 21:09:57 -0800 (PST)
Received: from fedora.lan ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d257a0sm12776577a91.11.2026.11.13.21.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:09:56 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Steve Glendinning <steve.glendinning@shawell.net>,
	UNGLinuxDriver@microchip.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Andre Edich <andre.edich@microchip.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH net 0/2] net: usb: smsc95xx: propagate MDIO errors
Date: Fri, 13 Nov 2026 23:09:52 -0600
Message-ID: <20261114050954.275495-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes error handling in the SMSC95xx MDIO operations.

The MDIO bus reset callback currently reports success even when accessing
the PHY reset control register fails. The MDIO write helper also
discards register access errors, causing the MDIO bus callback
to report success when a write fails.

The patches address these two issues:

Return register access errors from the external PHY reset callback.

&

Propagate MDIO write errors through the MDIO bus callback,
while preserving the existing handling of -ENODEV during disconnect.

Both changes improve error reporting to the MDIO/PHYLIB layer.

Artem Novak (2):
  net: usb: smsc95xx: propagate MDIO reset errors
  net: usb: smsc95xx: propagate MDIO write errors

 drivers/net/usb/smsc95xx.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

-- 
2.56.0

