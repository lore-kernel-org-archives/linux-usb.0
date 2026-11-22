Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343336;
	b=IKAs81QxwzIdd//urHPkJzTGdXOrQIJUF0RfAO+XUSppDRnU5LXhQndL7oAIp3fdo7Jt
	 CpOqmp7T2sC5/ZOK4YRwWu9pI/qCLFbbb8hc0S2oYOaXRSmD7b2jG3lWoVCopWlcIVEhF
	 iOmOyhyHbY1RgZ2xzZQG5VthF1+ZulO+Q+aoNplwGoEmPFOBHPHJwEGH/OurHQ6qwq+Aw
	 q36D9BHL3akqv2uBmpKBfN8PCf3DYUIzb7K/TZmBlyTL8PkploNF9V1Sj6mxT+t3mTJya
	 5QEStUHfP92+YonSrMzO5jr2rmVe85UcT+NViTR8dvQ2N2n/v4QW1H7Z0pxqIkqBIjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
	b=KuXJI0VxvHC1Rjc8KFyKj3s+8/FTlUTLkdxKpLFItUgf3yIgt8x6eJx5zAvv+cqPB/pK
	 XJdLcXTVh7xgaL2gnvSs6O4Nl5xxOVTDZ/iB9s1ea/ZyAFP2r6bf3khzyL5SsLnwYSmN/
	 ddYPQ1TcgGfEP2ljfrYhcf0zj3pyNwLPKsK2/g5DqTdiXi0ndST257YnyGlIQmdVpoaCU
	 y/20KVNg2HmS+acBaISj+hi5BDbv3rddgE+W83O7Q1gru8Geg+5EJxH7JXeu0zPW+48QB
	 GvlxXQTWRf+P5oXJwDQiypqvZhHuaaLup6AW4YmB2aI962l4Kqvj6IuOsv5xUVPqBHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5SErA4S;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690B606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 10:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8690B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5SErA4S
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c504fffd8b3so124046666b.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 02:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343335; x=1795948135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=U5SErA4SKPMPlUUC8Hpj3tgK14H8t3haFRITvCal7hWmO1uQCJM23eL2NKSL+3abov
         t3Ga8hZjRhzvVJ9cbw4Vb7N1YpXch3MGgNvwtd0JFW9deXQsvKqE0TwaJazOc4dRIvu1
         A+bpYcoM/yNfmL4mNx+lNMVLOZqXuHsJKuyfndLRis90ncrcwXqJJTV/cR+xrjDTftiT
         uwHZqkkDG46HnkkpVn7osItNtMa00RW43rY6JIT9X89ugjEeOZaSyccC/Q6GDKYy2Px0
         USA7CviCcfLYoNdig0G51EYTgKP8yj4hbHGLxU06uv1f22bnjpU2zE7+sMkZ45gH9eUJ
         5Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343335; x=1795948135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZ0O0POJrr0conSKv7mDqlSwmUjcS392Zlp+KvMCf14=;
        b=VEUoqu5jx0MMZin5Sl2z62GaDZRvBZIgc8B7lcBUEutafiCOSS8ra1k2bOOIRblF0/
         eoeugNV56i0dTIFh8o7OHXfzykktd2NWo/MqADcu3kWb526F6EpTpgeEu9ecku/sJjHM
         Y5UqD/Wd3mqlfg3oL8yjygh1hrrI3m4K7WGaa9j51hM8P+GgJ6N5f//2I8mAUWQDfUXv
         ge4xJYryWaCsQr1GISo648CKd/9vi0IAcO5KyBTjIvBwnwDpLSb6/+/ul8AhP2xxW37I
         dZ3SFCFvtlDBGxjzVnNfspN3kSaqiK04oMMgw7kjcA2penS5v3SXA9drd6D16eSvLRnN
         qD1w==
X-Forwarded-Encrypted: i=1; AL+hErFEnfJJyceQjYM1EKKnk0eOvzj2a+3FsKfTXh1fA1NW51k3Aiw/vH3GzfMI+Fl6n9Aezz2h/dW0qu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+tDiSEEVa1P5GjW3AmHKWMa3K8ZcGYKGEFZjaAjLzKH87xJy6
	EJo5ivyqxnC5jUIVopI+1vOq975mBTvjhNO7F9G8UpNaSWVtwPPNu5Q=
X-Gm-Gg: AZFdTZcehzTskyeDVzp77g4ohQe1bIhcwupf8Mrb+qsKIUEF6D137dcLl3CAU3ewvKJ
	z7xziNI7TO0o83erzgqwiWyp6Ccms5Z9lX/0J9y+S67OJGEwAcOzVmv7marvSSLhxuma46+kp2n
	4jAXyf8q6Ecdghobu/7yR37qSPHczNIJrk0knzSahrWaFcB5Oa2Nptjs2GBRGe9fjUPlwYgCuqc
	ludSAajfmBJmbq9gWmA8GHbwSA52Cm/7badOcvJC4rkxumIPG//ZM57leS3fUj0mNlsp4xrZcZp
	BznuQS0tRrBek1ZKSV9xBYWPsuKfkYlhXaHDZdfEMAS5FIS6Z+IvN+gwQ4dCTcQONk4RhDYfX7N
	N8u50SbTqwvaNB2HStwBcKFy6lAejyhLs2ZCP0pidBUcYIS8LCO+5ab9US0yvorWVXSN/eCM6w5
	2Z7er8/RRdNMubWEOrPDB9NNmPFE1ZiN7hYf2imhMpv2y2znwUmohsQ73IN6dVwmMI6RN/1D6XU
	ctFkkM6wzisdmae5SgrNZIvmFPtZlfdRKCMX3mvMNPr2+eYmn3SnjP6nCu2o1DSdBevEBg0WTmA
	+i4D3suBqRla5F0s/T/Mjy6SHdaH7NOt39P9zSm7zGFw
X-Received: by 2002:a17:906:5ac5:b0:c46:b9b0:8e8f with SMTP id a640c23a62f3a-c513ab1303fmr511361966b.41.1795343334777;
        Sun, 22 Nov 2026 02:28:54 -0800 (PST)
Received: from llm-01.drunkbatya.int ([80.251.127.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022b2bsm295252466b.83.2026.11.22.02.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:28:54 -0800 (PST)
From: Max Andreev <drunkbatya.js@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyle Tso <kyletso@google.com>
Cc: Max Andreev <drunkbatya.js@gmail.com>,
	stable@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm: fix missed frs_sourcing_vbus() call during FRS
Date: Sun, 22 Nov 2026 10:28:38 +0000
Message-ID: <20261122102839.2902079-1-drunkbatya.js@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Since commit 0908c5aca31e ("usb: typec: tcpm: AMS and Collision
Avoidance") the TCPC reports sourcing vbus while the port is still in
AMS_START with FR_SWAP_SEND as the upcoming state. Because of
_tcpm_pd_vbus_on() ignores this state, frs_sourcing_vbus() is never called
during FRS.

On Pixel 11 Pro XL after an FRS from sink to source the phone keeps
showing the charging indicator, and about 20 seconds later VBUS drops
and the attached device reboots.

Call frs_sourcing_vbus() from AMS_START when the upcoming state is
FR_SWAP_SEND.

---
I'm not test theese changes on mainline, but tested on Pixel 11 Pro XL
vendor kernel 6.1 with the same _tcpm_pd_vbus_on() code, as i see
mainline tcpm.c is identical in this area.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
Cc: stable@vger.kernel.org
Signed-off-by: Max Andreev <drunkbatya.js@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 51e5c72799f2..5caa649a92f1 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6889,6 +6889,11 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
 			port->tcpc->frs_sourcing_vbus(port->tcpc);
 		tcpm_set_state(port, FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED, 0);
 		break;
+	case AMS_START:
+		if (port->upcoming_state == FR_SWAP_SEND &&
+		    port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
+		break;
 
 	case PORT_RESET:
 	case PORT_RESET_WAIT_OFF:
-- 
2.47.3

