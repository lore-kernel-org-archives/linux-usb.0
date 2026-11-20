Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168759;
	b=afMSyI4JeOrg8DBBA0QxMbFBQfSQbnPNYD/6ZgGTIh2juTqXk58VnQAoHSoJYxCASpWS
	 X7dEHX0XGEg9cZToWQi8D2U2W7YtRmlUuzVhGacxMgx/EB8UR2/Rk4kNmqCVGG6Dv/QEz
	 4lCD1aNfoE0zQCUL8N4tuVYJpxlA5x7F5uKV8EuuQGIy/hz9nwKiyRarZRaie6xtB7qX3
	 28fbPCqwtXjAFk4WZqFWCbyhBCr10JmZ7wiFKPJkjSM5iOWwcpJocFYhvfgaLcyx/QKh7
	 +kqkPB6NJCJKTWj4RBsqJzT7VPG5f4qIqFjm2Aon5f59ahAOZex92smVEh5BjqsWL4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EsX/I2j/ckEWABjyjh0CiURx+c1ahl3Dggu7o90Iyg8=;
	b=bI4HpKn9zp5v8Wg0Urq95lABvVF0HvOdepfFdXtyPabZaFaUeTWtMA7X9VTK1n3Pyc5o
	 +QxtwOGeU6a1N0FK+Ni27xCUOFZWT7inpPewVGaZUQMJTKfbVO0j6uaTJ2cFukxlWRH4b
	 Ee4k48nIa7mOpaFXgDPbB5yhVHqmAjje+KXqUZcvzbzM7ovgaKDrvZgnliRJ5cCmNjRwb
	 7zQR7yIznNtI5hBDKx9mHPxRjGmKt9tcpm3FZA1Gr219nhGLa9yNAFwtEBsax8m22gb66
	 yVahKvGOKG7p2pgYFJm+sJzAqzBFaKpoHr0bm4tYQfzXnnGX7Wj5yZKjRRa+4uRd/jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O8V0pYA8;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89296606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89296606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O8V0pYA8
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3730705e9.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 01:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795168757; x=1795773557; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EsX/I2j/ckEWABjyjh0CiURx+c1ahl3Dggu7o90Iyg8=;
        b=O8V0pYA8LuctVmSZmJESeCLmGX6vN46pbUAwPQt1/GQ6dQOtrAZc1oxUAEIYJDqfaD
         76AS7vV6EZJq8eBKBSyyJxoPL8uKL/CSZ6YnEFzjtBniVkotmx18TIPfEt7eVvR2Jw7j
         OLo3OPqUr5naz+Z+FrkdtYb2g/nJKRCM17M7p/fBk5ylklgqcrfIRn59MvCAYojz+ydd
         1cmvAF204ZKksSqjJ+1nqCgH243DZq83+/ZaF3cJcWgLg3rng+LK7qKkIVL35/kVt2cI
         u805BPzF1lWGNjG1ZPqkTHnIxvPkT5cIxmhlTj5pJuY8f0bBzj8W8Dvh65ApfMUXy3/D
         /D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168757; x=1795773557;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EsX/I2j/ckEWABjyjh0CiURx+c1ahl3Dggu7o90Iyg8=;
        b=btHlRJ3EgwhG0aTpMHG/DUujrwG4HqPwY0RQP479RBLfTB6m7GTnb/Bs+sDplqbDtg
         THaW4xziB0SnOC66Mu09cnHiWF0o6zFUTEFVlH9QY1Zqebr/9oIoH9NIdBw8C9kCJcB9
         hhGv3KFKkR8NiPUVUqxod7ZskLAx8sm5XkkuLkic50tiu9Yp4nPpZ+Umw3reGO4hZspv
         hbnmnJoVRPpql7pj6D5CmR4ixQFiLRVUHXHz76ZH+vbw9YqO3h/U/wzI+x/D6ZLQUw14
         x2XEdWPp65t7U7Ta2m/ZsDA8QOgieU5FKAFXYwO4GAGovDPCB6YU8wCpsG+cjah6maqe
         ZCrQ==
X-Forwarded-Encrypted: i=1; AL+hErGJVYBzn74/1wvLxftd/ShjAV6NhQWT2cGVxE8IxqRaoVCxRRCMCh/lCihrvtwg07YFd/vEd05LjtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aNidYMpcfDMuD6bf9bBZnANi3212g6HAdY2tR4SZ/DhQv/Ohc
	bkBrgXt5if4fRunDLDisQO69SLt/gQbi8RRfRgPUP/pGin/zupA0NGZE6tPyPOyekxUTPErZ+wu
	SC7/Ol68=
X-Gm-Gg: AYBFou3ePSBL3NN8xW010wTk4oBxOeroo5YPn4/QBSPRIYWnE8QjwAEHdz7iu3qYuko
	9Z3XpHOONJO47o2Qt3BZWkUWkhV+++3oNU2QzhGr2QvK4N3FT3op6UytJyMgqY4T6XeQ8u3hwQX
	LFl6cM/nH+NxK8eO8cPTJhHA8rAozutoWrw9OQACSWozbasLeWRhishnK74bSUrSmL+yFftDVSF
	HKVeKQetXR96yqzP6pigvvWgM7GxnzbD7mrNuQo5V5jA6MK8ofR7T6MRqH+tlHMeXNcY3RgiuIw
	5eDoNqUi3G9lpqtikfvKWJwASh6j8UD5qxvppJVFAq77QVDc5FzDX4rbh1+v8b6wzfmzHmBK0I1
	OeBf470CXI/r2UDAwnQwc6KVpUQ2W9yTjpPmg3jl1/gynEy1GFgp3wHVrLVD7wPpPWdMeR2DliG
	sZRBwMNe2f0Y+lBSQ0FOpcoyFRhRvJzBy4QY5b5Dzg9Bq9s+1aenhgwczrXIWMXq4DV0evSovYJ
	1NJcfAtieeUoe5W4vdEJ9tT7r35/aAWE4nRGgv5SyaJDYkLFe/zoNfU4QUh12zAFk4twEUpNzF/
	SSBZ65lSeA3DazuFNLo6WSNRAAiV4ZrfDyZt3w3lTMRlLvLarE8=
X-Received: by 2002:a05:600c:4e0b:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb8881ae90mr57491685e9.32.1795168756717;
        Fri, 20 Nov 2026 01:59:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm70741515e9.5.2026.11.20.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:59:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] usb: typec: qcom-pmic-typec: properly tear down port
 on remove and shutdown
Date: Fri, 20 Nov 2026 10:59:12 +0100
Message-Id: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAPAZAGsC/yXMUQrCMBCE4auUfXYhCbRSryI+2HW0K7SJ2bQIp
 Xc36uPH8M9GhqwwOjUbZaxqGucKf2hIxuv8AOutmoILnffBcYlJhYukiV8SJ77rG8bSCzy6Vtq
 jo9qmjN9Q0/Plb1uGJ6R8z2jfP7uVT0Z5AAAA
X-Change-ID: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=856;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0UY4gCGqKYjt3tE3u8/yCjAdtc7MwcQrPEW6TweYBF8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrABnyuxrATGM7KT/33vRAPKPR0GHgU/NIFn6krKxr
 O8+EnmaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawAZ8gAKCRB33NvayMhJ0eArD/
 9OcsaajjUkfmLLOzSOLWuIIwLJ7cb65esc6UQXdvAbKklFODZcjK873qoWySAdFlHJRsj16B68IEgS
 duZ2nE71TbuAEUqVQ0qEdBDjC0aqLi3w0+JHP/csIV2fy5vATaw0nGGqUQ2VsgC50pxcR3TYoRpjMm
 tg7xI2Gd7ovxmdtQLG0CqAZb0NDV78DG+VuijuWaCXXABZguFnACJAfuLsS7Mm21FzEofW5yHHgJ9h
 nPOa32wHhbtRUsUoN7FQTPG70LmdaXI+DAxEhimTnsstMYNlnAbk2Q3DobSP7hzMe2oCSW3faUzb2J
 Pz5ZFfctpsPs4oS4sKThAgfoiQlhJcncIeKZjOShXrn1DCbpMv7BDdpGOP9f3Fxj9GFxYYrVu7fCAR
 nd/DKMowBocBO6LNkP4CnMPPzaYRc7XQ/vSbY+js9m2ZpPRnaYl7T7RN/2x9y3agb8Cw4BpZSOprs/
 wNFvaJjXrnaAaHuyOPg6HR1p8zfjghGwD7ISQq4G6zvrZk3CMbTQVKJUwhzBxGLOXhhoYuoUba3geJ
 gh7aqzjeMH8bNjIy5Yt3zNwFCl720TqW0WJbR6Jxzp+mrWEWfnQYF3ybNxdnuk3YMVzrLcX0IjAXPO
 sNSUfrkvkwHNIN4r85kb156E+CCAFT3DK17BRauxjWBZuKBwWkGRnyugB5Kg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The current driver doesn't leave the port in the same
state as found when probing, and leaves the port enabled
on system shutdown.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      usb: typec: qcom-pmic-typec: pdphy: disable the PD PHY on stop
      usb: typec: qcom-pmic-typec: detach the port on shutdown

 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c       | 11 +++++++++++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.h       |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c |  2 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c  | 11 +++++++++++
 4 files changed, 24 insertions(+), 1 deletion(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-topic-tcpm-qcom-fixes-c9ce1e65c570

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

