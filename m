Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986826;
	b=eQAXqLfyJ4S6yQYKy7lwOHXswWubB/D+pK7qTT4a9AZ5qM4cRSPW1lhKLS3RRhqPeOYm
	 AP631WycqYQd9EW6aYtJGy5IU/NIbID3BT0YfhxRJfSBcuohWcCaFUS7BRXUZ6QLb923F
	 6L5fe9Dazali7mZ9BT+zycglScjg6GTHFjF6ZnSDqBjHp6Ii9d61/m1ZHEF3ykm0qrdDC
	 XetkpY0Q1G8RyJnUIVGWYXc81GgeA7V3mQ/9pIfUGn4cBQMbjy+IS/pHV3N/+WTiwUM6o
	 SYeUNziYKIOFSiJ/liuDvzi+ZQoemsn/1b14Pa3FPELyDGxWV+uDtfBceIUep8H2nCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zANzWoKvBu6ISmxHtAdZixMys03+K9+RePovcEEC1NY=;
	b=T46GgyOQYdF7PEAvyHRtfTCQNPqtWvZJWupFfLEgHh0KU3mSyeN3dL30+DU+tmmqOpdF
	 M17QS5BN0mJCX4S86/BMU6L7ruCXWxvtlRh5YOY51Jq6jxAifsMb4FGYbfFCcAfZBds5O
	 isb9O5ONshQ3/+O3V4Rk3F+ORyPxZhMWUIFHW4KCHVqdahhE16yOY8n1oW7IEwc7Esor7
	 WnYFfC1DaKWR11zga2p2+GS716JDtSVcZxkbpPuTgL0Ca7pWChO/X3Sap6+b4pa1cTJy+
	 47SMfDer0qIrVXgfIxRXAWxs0h1mMAQIpC9oqTtLDMH+Vb6hK0r1escjC1KPnIMl9lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=FWokIqS1;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA901606A325
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 07:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA901606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=FWokIqS1
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so356072f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 23:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794986824; x=1795591624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zANzWoKvBu6ISmxHtAdZixMys03+K9+RePovcEEC1NY=;
        b=FWokIqS1NX0v4mhawZqL/V6H71jWUSHvjb/OUUSIgQjv8hO/W1zwaZ6YoisemSaIlR
         EsBHl7tt2axR24UU9pWMlO7OrLDkCM6yR2Z1XialepdfD/wXkOLwHfVa3Kqn0TuAb9OU
         Y/rfLcbMaGwEubC95+ywJVcf/lclIFNZbqiMeW1PZPU2RUgPt49Dcqo7auvvyDLL3JXU
         vdjq+c5yw9QcjeInFaiQVKuRjWto0F7Z5ZnUml7I739tTGn00yuqsCl8JnzUBY2R18uQ
         kpVU5bVoNE2yR+MRFVkH1dbb349eoWFww91a+svAfsZUYuXNKSuGE6XlpI8YgRuaWhI8
         8fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986824; x=1795591624;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zANzWoKvBu6ISmxHtAdZixMys03+K9+RePovcEEC1NY=;
        b=uB/rho7ETbziDF0eXkcEimsbD+vSytTrZd3aAJhVs+1FtkV/EOCnd3lgM4S8Vw+zVg
         C7EyKwGjW6IJ1JpUPx1+9AwPqJGSaVjm3iC/Yo5M06U3NFe1ERlD68DtssjKeiUXmAL9
         RAT1LZt9u+Q8frkLMl0cPd6QUbpHNjmbp0f61LmaKjCjBGoyNeYfn6gytXM+2xZMB0O9
         w/0A/iJ7F3bunYwaHL0dx55FAWTImNuF6tmRo56hCc/S7nCMM3HajJNwZ5dKj92Inc0X
         AZiJQnyzBmVWFottjSDpBCv1FMfYZJMQASPjRk76y6QOxAlwy70fjflm1+2fz4NEjrWL
         Qvfw==
X-Forwarded-Encrypted: i=1; AL+hErHLuojwHcYrmJ9Qbt+GuWu6BahtaRudOn7ZvrYt5k86qzsOTcTMygaBzUqBigt5r6l4Xn5kbCKT/5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QVFur8oUO4GgLHdDP1Q4L/waavnbKQcDyR45p0acTFfE7cw+L
	BGEYcheWQZEjJy33bN/cMH2moJK2N74/QGll1uXCKArOKBGq5S0q/Hfs2qIem9VUn3IMlgBj3hq
	bNZx+
X-Gm-Gg: AZFdTZem9cGm8wOYNiNeJ/DszLtKsTsyoF3zuq4G5yQ//fg48r9odlS1NIAKgU6OKUf
	YmRfjeA1WCUlxt3BOAwaftSxEfLnPZuD68WrirQhxDDgb1IAIR73NZC4dHPhapy7t4qSNtFyJDt
	SurFGpAXoL1O4Fe89rwt8zFuOuyvKSN0EJBicx29T9hg1giUdyEZTbezAuQ/l9nw5Sran2d6Ird
	SzD9zIfLUibjR2huQJUO1YtPSfQqaBMSfvC/NnGrrhUcMXtsjqOk4efFBJAca47Kyrh4mw9ehnU
	N587mDwKwkJzPF3aL2ySGLGVVCBnyUHcE03kTJXMoRVglwizDy0/OqRBElA6JFjsZMYaw6/8va8
	K1lagWhjK2ooJlFC8pbPAxakX/sPQ0bjosknFZfe1728kbgcrAAWYrWZPZn1QRguzzt2Ju9OWNF
	Y77kbePQgZRSgtimdiGBnSKR5nBS1Ki3CZEP1mlayZFJcrHsQ8xcgibXQVLjPTxOAkz1khwnq+S
	2xoO6MzQyXVC2DYJpARsBgwrLiZCSh1zHDARb6V/NXMUekorDmSWQqnAIxTiLA8p8xPYazjkzGf
	hP9wHNyRhH7ie1ARTSVeTEs0bxyOy0KUeuOogTo4xbFpNVNZdhcRyO4JPauD5ok22+PuMQALvFQ
	KzEx2YracUwk=
X-Received: by 2002:a05:6000:184b:b0:48c:4658:602b with SMTP id ffacd0b85a97d-4a637f6366emr4060212f8f.10.1794986823892;
        Tue, 17 Nov 2026 23:27:03 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm2901099f8f.38.2026.11.17.23.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:27:03 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/4] usb: typec: tcpm: Fixes for talking to the cable
 plug as a VCONN source
Date: Wed, 18 Nov 2026 11:26:38 +0400
Message-Id: <20261118-tcpm-soft-reset-sop-v2-0-b6decdc95e66@flipper.net>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PwW7DIBBEf8XiXCrAi8E59T+qHADv1lSNTYBYr
 aL8e3HcY0+7I83um7mzgjliYafuzjJuscR1aUK9dCzMbvlAHqemmRJqkFIAryFdeFmp8owFa1s
 THwcPTuqBrOpZu0wZKX4/v76fD11u/hND3V/tjjmWuuafJ3aTu++PIM2/hE1ywYNBqaG3ygbxR
 l8xJcyvC1Z2fhyQjNdba1APMkuuhrnlb3XQASg/2IkQ0ULoLZJXxsA4KQIB1rRJtEfzriAP6+U
 S66lrBgcT9kaAGGGAQFYLiUF7BVpOBDpYQA8twuMX9UG9CUwBAAA=
X-Change-ID: 20261104-tcpm-soft-reset-sop-96b4a156f823
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 RD Babiera <rdbabiera@google.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8bckKev/hAlqltCilTB95y0D6OerJ3QVe/I4nyWcAsY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWT9DTZ5LGrB88J16U4X66uSPHM+dvDEz4ryu5l98Rzry
 +iPG5JXdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVj+QZGTreTTx3exsv+13VaeINc7r/mZ9P3r4z4k78orAuyVwZ4yuMDA3aTHc
 yq5eJzr36Nm5dY6X8sS6F2IUsKZ0bb2f2c2gwsgEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When a TCPM port is the VCONN source, its exchanges with the cable plug
on SOP' can leave state behind that later affects the port partner.

Patch 1 fixes a Soft_Reset meant for the port partner being sent to the
cable plug after any SOP' VDM, which left a source without a contract
until unplugged. It needs "usb: typec: tcpm: Stop a source from
repeating a cable Soft_Reset" [1] first: without it, the repeated
Soft_Reset after a VCONN Swap would now go to the port partner.

Patches 2 and 3 fix SRC_VDM_IDENTITY_REQUEST, which replays
Source_Capabilities after the first contract, and stalls until a Hard
Reset if the cable plug NAKs, answers BUSY or never answers.

Patch 4 is hardening rather than a fix for any known device: it keeps
messages from a cable plug that breaks the rules from reaching the port
partner's handlers.

The first three carry Fixes: tags and are meant for stable.

Tested on two FUSB302B ports (RK3576), source to sink through an
e-marked cable, plus injected cable plug answers (ACK, NAK, BUSY,
Not_Supported, none) and stray SOP' messages.

[1] https://lore.kernel.org/r/20261103-husb311-cable-comm-v1-1-6217dabc1a85@flipper.net

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Split the SRC_VDM_IDENTITY_REQUEST fix in two: keep upcoming_state for
  a message from the sink and clear it when leaving directly, then move
  on after a NAK, BUSY or no answer as USB PD r3.3 9.2.26.2.5.1 has it,
  keeping the timeout only as a fallback (Sashiko)
- Stop passing Reject from the cable plug, and pass its VDMs only as the
  answer to an outstanding SOP' request (Sashiko)
- Link to v1: https://patch.msgid.link/20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net

---
Alexey Charkov (4):
      usb: typec: tcpm: Keep the Soft_Reset target apart from the VDM one
      usb: typec: tcpm: Stop replaying Source_Capabilities after cable discovery
      usb: typec: tcpm: Leave SRC_VDM_IDENTITY_REQUEST whatever the cable answers
      usb: typec: tcpm: Keep cable plug messages away from the port partner

 drivers/usb/typec/tcpm/tcpm.c | 131 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 117 insertions(+), 14 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261104-tcpm-soft-reset-sop-96b4a156f823
prerequisite-patch-id: 2ea442b68dfeee84c38efb27749d2f40487d2fff

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

