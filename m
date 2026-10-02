Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C3D4457D3
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 20:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972577; cv=none; b=twTH1T4Q1WH7u+NacXw4Zrgdlyjoa6++YQHVysG4PI8WZlAl/FLQC/orr7DGtunW5us/pNS7eRLmUtweOqxnM0fgQRXVbFsZiTCQHXotirZguLvUrIaKpkbHpil8o7JUkIP8YXMvem+m4q9LA86uXZ01bvusrN2q212VjM4fMWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972577; c=relaxed/simple;
	bh=1zuKCeX4ubKsHdgFEEDZASCv9P97PZ9/9qgb9og1SDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgOFG6X8VPsYf3SFXQKJS1qPJCwopBXE8JaDVSgF6A8ESSgmVkZB9iFEpws2fAwDjUiaHydy4ocroX7AHbcrYm42JEsks4AeAqANATJHWXM9lj6ZZPjoadaVik83dY772B90LmPPr9YE8CXXV1iA3ur3y5eTcN0eCzpvNXehNsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbCm341R; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbCm341R"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939656ff6d9so819460285a.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 13:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972575; x=1791577375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxbnn0+HyLrQHSw5N5vcj8DOerEWS9jU0mk7xDwdzyg=;
        b=AbCm341RvLDwkmK/S7LLO03iuarUsWKqjvRSx674cm3+gptpv+rQeQ2f30UfVWWZF5
         YmJ1dun5ajVItEBWyw3VOsnJvCOz7p/s5zJy6v0xH3lvzWAYFmCmarBD4JU4ryjYLGrK
         z9nEsVgN0yvPS3S/lDfXNQxkfKQtxN/nNmIUnLCmxAzWp883aNhSBujpc+5u9dW7N8x9
         Xfjiq3wr8f8uQmsCc1qHmmIZ7L4xxo+MuZW343D4Up5IoW+u1rtzxSzThxWKkqTgqScq
         Xf3hvlpMUjItdqKnSrhAquYe9YMm6/rwdh3zWBTvUqGM1x+AeBOPEDZyGaRTjV2CP7N2
         0pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972575; x=1791577375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxbnn0+HyLrQHSw5N5vcj8DOerEWS9jU0mk7xDwdzyg=;
        b=GdAQ/iOYYuGZni+UobbAJIUlVDue34D96dJHc7AGSj6Amo4XoFqwDT2Yx1hij4rBWn
         wgTHxmy192OZZrVoFrrN4cKfuRqNcUIew4y9tm1aBNqIx0/R+9uGj4aKO/3Vy1EKDkmS
         NkSIwqTUOzEERSKQhKC0xWvBzWn8cIOi6/Jb9D/ihuOBgZEZmiItq02I2JNvHlWZqF4V
         3z2fUr2WHeD/arWGpiOm28zIDr6deI4ykZIVpzXPW2nZey7BwAH4S0KFagg2CSjUyzBw
         C1uUyAy1gbXYOAr3aQiRwPRU0Wz5jEmVtL5BaPe8VsbtZeTeQxh8Et9FTKSKgfYc1pVP
         LQIA==
X-Forwarded-Encrypted: i=1; AKwUvBzpcpZnz2jcIdJoi6olvdifQ4Gd0GKqTSWjOOdudWiU7SawrXXZrPsP4jcATvb7CBXU9MfiNUQX25c=@vger.kernel.org
X-Gm-Message-State: AFuF++nRHQyY/BPNScaNZEk81FvOFHufm0Pbv8bsMtY7uYYAVDZAiNR8
	G1j3t+fWn9keLAjcr0gc5unyq4CJ+z5nxjfjU7UQ8/+8n+XFab1/sJtA
X-Gm-Gg: AYBFou2zT//0VrA92gMnTkokxB5lsFY0TJLAsB4FbFoLpJBNeRyzXPOr96oXdVeYMlj
	P3/inTsELr+Aytc9vhK7gEEtlcW5CmhTTEvWL/Et5Gus9vVwK+9KkrYrH+uCE42JPIJi2C3vGhF
	28GUmqTOomNB7HF3HgIlHfAEF4KhwPGka6R3tUsZ5IkQuT9brtFP8tuAR4bBesciQBETWOIyfED
	69mvt6WahX3dsuOF57N/0iz3DwuUUYwM7XevV1y0CBH3nZiUwXTVvZDPVQQDwrPteX4rLYi4l9z
	O6IqBZZQgalsl0zDB+hOnewmpVBImfdwlqCprsOVdYzffuAZ4tNysQNQhOUz1xwyT+FhVSIoInB
	EgWTzLNjoRimEaCZnTrtHbRGnRxvlVpJR/4y7IbOoJw9j1t9TjcPXd8S6HrWmc8wpgPk9tF3wN+
	v2jbKgQedLEZaGU5mLdjK2UXpQGfuju7FNC8NM5bQxU0NIbb4BsQjzuTT0whzs1/tOTfWOLez7y
	s9ypebTvtpgrBZJnpTf4JSeMMMzq2s6r1lG
X-Received: by 2002:a05:620a:1b95:b0:93c:5dee:f04a with SMTP id af79cd13be357-93ce7a9de6bmr754544085a.7.1790972575184;
        Fri, 02 Oct 2026 13:22:55 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.192.96])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d361bsm308676985a.45.2026.10.02.13.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:22:54 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saranya Gopal <saranya.gopal@intel.com>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungjin Bae <eeodqql09@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: typec: ucsi: reject GET_PDOS responses longer than requested
Date: Fri,  2 Oct 2026 16:21:02 -0400
Message-ID: <20261002202102.599998-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092932-arbitrate-snorkel-3fca@gregkh>
References: <2026092932-arbitrate-snorkel-3fca@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

In ucsi_get_pdos(), the number of PDOs is derived from the data length
reported in the CCI register, which is provided by the PPM firmware.

The function requests at most UCSI_MAX_PDOS PDOs on the first read and
PDO_MAX_OBJECTS - UCSI_MAX_PDOS on the second, and ucsi_send_command()
only copies that many bytes into the buffer. However, the returned
length is taken from the 8 bit CCI data length field and is not bounded
by the size of the request.

If a malicious PPM reports a larger length, e.g. 0xFF, each
read is counted as 63 PDOs and ucsi_get_pdos() returns up to 126, beyond
PDO_MAX_OBJECTS and the number of PDOs actually read.

ucsi_get_src_pdos() stores this value in con->num_pdos, and
ucsi_psy_get_voltage_max() and ucsi_psy_get_current_max() use it to
index con->src_pdos[con->num_pdos - 1], resulting in an out-of-bounds
read. This happens without any userspace action, since
ucsi_get_src_pdos() calls ucsi_port_psy_changed() and the resulting
uevent reads every property.

Reject such responses in ucsi_read_pdos(), if the PPM reports more data
than was requested, print an error and return -EPROTO, so that the
invalid count is never used.

Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Print an error and fail instead of limiting the count, as suggested
 by Heikki.

 drivers/usb/typec/ucsi/ucsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..17beec16fe19 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -862,6 +862,7 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 			  u32 *pdos, int offset, int num_pdos)
 {
 	struct ucsi *ucsi = con->ucsi;
+	int len = num_pdos * sizeof(u32);
 	u64 command;
 	int ret;
 
@@ -875,11 +876,17 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
 	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
 	command |= UCSI_GET_PDOS_NUM_PDOS(num_pdos - 1);
 	command |= is_source(role) ? UCSI_GET_PDOS_SRC_PDOS : 0;
-	ret = ucsi_send_command(ucsi, command, pdos + offset,
-				num_pdos * sizeof(u32));
+	ret = ucsi_send_command(ucsi, command, pdos + offset, len);
 	if (ret < 0 && ret != -ETIMEDOUT)
 		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
 
+	if (ret > len) {
+		dev_err(ucsi->dev,
+			"PPM returned %d bytes of PDOs, but only %d were requested\n",
+			ret, len);
+		return -EPROTO;
+	}
+
 	return ret;
 }
 
-- 
2.43.0

