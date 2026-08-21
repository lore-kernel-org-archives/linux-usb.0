Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECB84CA29B
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329014; cv=none; b=T0Z3ETx+/SUizdSet2Eefvc1m/4DSBeoujqJUSxeBe/eyWQM0N7s6EfsvjQxvLKcHZsX6G00VorXwZciNWcVAwpw3lWSYiCsWjpFu6Q/jRjGcxk4y6EWVuc9f1nMheUfF88hQSnXGPhv05nkcUbnUM397rXzrrgTv7sydzbWhj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329014; c=relaxed/simple;
	bh=afuFWuEcuVVgf1+eYfaIdaB2T6Kws92Mx6NIQID7+78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LV8oCDEOXiwX2j7iRjI1m5SfMwpfC/dftq9HIRTCo3qrJuFwbedJ1cGHQzKM2yGoRqEZJjN+fgvyOXUljVxXcN8tx9pRDERfi0UGmuDk/ADt+AG6OHhVhmXm12q3kyp/qUF1/SpaRJ3BnmSaR6kuGUUSbjRictQeBmKAYK3M6Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=kDyt22RJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="kDyt22RJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so11592035e9.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1787329011; x=1787933811; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rLPkB8azVhIW0KCjbvwUW+Yy9rTxtQlA3RfVUmAFG7w=;
        b=kDyt22RJ8IohhDReNcENvwvusejHQW4MVzNNzm8sgRRnCtNspG9jzSS6s03aQCfRQX
         leO9gVmL0bSZyKPGz7KDBuBy2js/ylu+NtXtYfE3A+yvizYAAy3oBn8/3z8Ckl1gQ/fz
         9PEMpm2mtiBqdIAp6/gtgWt5wasX+MFrFlBMfGogQ8xY1FBvBbzfFty714J7JwV3yAY8
         qNC1ohEf1mTByuG9XcTnTaJQ0VcRUsBenkQMGg86fv+d2HSZQ4ezRfOgEowQU2nLK7aN
         +iNkynL7rBZMAe4EuQI4kV4mCE1FM4rF0h5d+8FzgCAIEXRAUp4kQoZnoc5snjAyR+oa
         rgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329011; x=1787933811;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rLPkB8azVhIW0KCjbvwUW+Yy9rTxtQlA3RfVUmAFG7w=;
        b=I8mBj0hZeRMHgnDc1scyKKcuOAKV/bVSE9LXTeHJ+yD1E5eTVhehOmeXKk9liRoX9i
         I9ylvOx43BNm8G4Imhwxs0FttVUUV8HY8dVfO/PXfN3AGPxG2D8Q9qJziVJDRR2l4W8s
         xjiuw2NGd5xS3CKj0j7uxAPUAyyxMDK4KIUytUr+ILKLcyb4xzyaIH46e2Cedycg9tCt
         vRdI+eRm7YkBacR+zn8sh2LTsUfwpK0cUNQxvMQkRMPkKhD7wGTmVhZAepG7fLeB9ZZk
         c581M2oDMI0TXTpZ25s7u+uR075iXO/gAEmojZgVRLeg9J3uSW7IjpAqpYLh3hndJ6nD
         dwbQ==
X-Gm-Message-State: AOJu0Yxh6Qu2TuGHx0YRAylFrlxidhijzLTYbcY8mjY0bCUQVPW6gjkQ
	UstX4hWEs2GzoYB9Be3mQUsMd1Qs/waLoum4kj8os3fcpI4HdXfHlka4GjQuhVfxb3YbU0NL0M0
	3JotjKwM=
X-Gm-Gg: AR+sD12rFYCy5eICbyT07PTEDG4/z7ZHX/uy1F7C5mQA1QpM+sXwWzwGmrgAX5hOomE
	Rsg5yU8vt1JRawJTZ6Iwe7J5xGlhtP2YUjIN9frBHRAdDZPQrg2tLSQNAey7hYgjhAQMBK6DRZm
	N/Yd9b0TK/gs5qj/fvhQVF9OIExDPWMQDW5X7pnbz9i9A1gqXjrtQ6IVtyT9QCJLgbTUCfGD1nv
	Z95d2PrdpIxQj4JSx5gE3gPmu5GN2LC8QlwXICewcta7gK+JTGbMyvyeVamGgwoL3AfnpS+2jdP
	Oz19b1UtrPvF2q2gc/LMuz+kr26Aaz8m3oQHzRKIA6RHztF84/s3uPYBvxydgoBQGY9G07kr67P
	zTkdTXGOkud6NtEXRd+KthFBm6dtmc/NAdtGPtN/X1uu9mMjJ0kfLhRPKSnKixP/R0iUoc3kLFX
	JbHm6RpYA/5SenIY8CZ/aSBbIOHd4P8/dFJ1djCKiV3QmgH1bkN3cyPwRqSqBPXa2m9k2eA90sH
	NYN9SkJ4HniPj/oHAODrRHIL6ry46qt13E3pxujVgjdoRX+ajia
X-Received: by 2002:a05:600c:530f:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499b82f3d1dmr123488085e9.1.1787329011489;
        Fri, 21 Aug 2026 09:16:51 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-94.alshamil.net.ae. [86.98.192.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bd581a49sm10245235e9.1.2026.08.21.09.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:16:51 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/2] usb: typec: hd3ss3220: Add support for supply
 regulators
Date: Fri, 21 Aug 2026 20:16:33 +0400
Message-Id: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA3ECVrpVYoLk4w6RbTMGCmId
 2+qb/ct3n+AkjApPIsDhHZWXpeMqiwgTP0ykuGYDWixsS1WZopO1SFaIzSmud9WUfPIC9HXdvA
 O8vUjNPD3yr6625r8m8L2b8F5/gDqFW8yeAAAAA==
X-Change-ID: 20260821-hd3ss3220-regulators-7777cdb50fb3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=alchark@flipper.net;
 h=from:subject:message-id; bh=afuFWuEcuVVgf1+eYfaIdaB2T6Kws92Mx6NIQID7+78=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR1VL7eGqsdmV79ckL47NV35uRaygYm8Xv+/h21/MTnK
 0WNHhd8OyayMIhxMViKKbLM/bbEdqoR36xdHh5fYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjqGRGMDN/Snasm7ex8L+fkNzmnJWQayzMu/13mzetncz/mvndlUgnDL6Y7/Ed
 8cxc0S+lW5l3YMrHm29tTC1jZtX8fnf5gz2T//9wA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The TI HD3SS3220 Type-C muxer has two power supply pins, VCC33 and VDD5.
Add support for both in the DT binding and the driver to enable their
correct power-up sequencing.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (2):
      dt-bindings: usb: ti,hd3ss3220: Add support for supply regulators
      usb: typec: hd3ss3220: Add support for supply regulators

 .../devicetree/bindings/usb/ti,hd3ss3220.yaml      | 11 ++++++++
 drivers/usb/typec/hd3ss3220.c                      | 32 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260821-hd3ss3220-regulators-7777cdb50fb3

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

