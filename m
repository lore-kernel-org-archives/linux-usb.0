Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778133;
	b=lOj0hgUQGTAPBoQtwW1VIDcX9IeHMYf/18wDFCAoseNwNo6EmoUJwwI36NhIIHLz9UB3
	 kAvloBRPRWLcDv4K9s8CD1Iq6hyOvj81+Crvb9v2gKK1h2/HHpa7beyUfbLQZpzcho4Q1
	 ydgDDFk7oEMqESQFXuXjK9pMFUw0jJNmn423lMCuJsO+QNrgtUmEOt9h3X7gC77ILZlUc
	 PcbYANznoLprTTUF4mBEiR6bvHb2cwanjwIHnj8MJjYqCfLqYuvWgGFbT9j7S03oUSlQ2
	 2sWHr+nqZfyWKIqkkjMqjm/d1apKLwOpCUt/0yvOa5Ks3rQYrB7OC6CDheFk4Z5k2UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
	b=x5pWUzKhsM2n5CxYVfxuKMy/+DzIMo2et6luCUsk7vHAQv1jWNZim41fQrpYLOtQRqIo
	 0pwLlCE5VPIUQiaQqVvk6kUITL4bneXnjNE55JeTjoIBriZDQBHyWpM631hbfEef/V7eD
	 b8Qcv6krYhd3P5wEtPevThC+QTsSeI7/wifc+FM9KfjDExX5dEbfXJvOb+VZTj9kgm9ny
	 Z+9WNKvP994TWxu85xXfWDMR7QsQjq8/i7WDBzfBtXKj5tfDZGuKorcDOWT7bELR00zdK
	 m0DnlpQFQXS3TovhvXbOI7MRubHBMhlHUxd4v9gXnNUdWbXnfPaFtAO9vWgFeHXAi6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFkDsZM1;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF11606A326
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 07:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF11606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFkDsZM1
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1438d9363fbso279183c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 23:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778132; x=1794382932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
        b=GFkDsZM1X2fvZz7fpFxwGKgbV3Y0f2EwxqtIEVZ7CppVOXupPs01n2FGhSODJ/HwCo
         8rMt6ha9VIM2fp74g86DkY7D85F9IdDGoovji5s68uv60eOKq1gYRGvlKEGsU+7Ddgv2
         jUt/tVb9mYlKeN/vKv//GH+bPwgiAV8hU6vY6HAbMEfWtEdsT8+xbVLML/BIznkhoahK
         1naS7Et+tMlJlVjSNDZq85Sk+48UYxBW8Ebh0dYTLU8Z/yyoDQp4/jzCQemr1QdI6j8K
         YvT8pb27yUltIZbjOwM7Rw8wOaP9ZH19nIjhCqNLYeSpt/IkS6+hXsUvbaFbDgothKNy
         HlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778132; x=1794382932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
        b=bDxv0chgT+5Ea9Kxq6f+Kxux0Ud2HIv2WHoS6ZACSYwhnc6DierW+rArnpWbRoCS4X
         b5fodQ/ITK4KqlmqjRtVyh6dcx1yTa/Zto3R6b+8GtwA0YZbYWj6fy0M3eROANKq3fzw
         yJl1Gto6TD0C1TzRwzLW8DcmStyK1DPU3jw7AVdq0CdgK3pN7oUB7PU2V6GccLFdDENa
         US1msGLLLiZZ5U3kaP7sckjNMwDjMDAAhF53XmQ2wiEh/aDts4Dfq7B4xEbIi2T4VRRH
         ReuzkFk+AHGECwYqoqT4mHWXniBj/69O+yy1t9auGd0Gu/Fyb6/Tb6fkVJXSebHtHxBL
         ywEA==
X-Gm-Message-State: APuU4Z9olq8+wh5JWLWqIdlw3QBA1yLQTUydiQHzWKdp0YSefvsJZ91K
	pY2TtGlfboDu/NewdnZ5ocUgvhwXJDy5E3rzgTw31xNBwwc0tGH+KDJoHyQT4A==
X-Gm-Gg: AYBFou3cU7FcSLSUfAj3wqAZKtx6K+gXdHxYpaz1Rrz8CxDWSEmzrfrYR5zf349uc0o
	8vP6YD/1VDfCUdGL8NazxnSPRcFcS5NDwcLlIY7ZcuFHE5bVrNaRPFPUJZG0+k9TwkZrGWGFDaN
	uB+BcVEz1Qr7Ay9DszkFP5bbe87JIqTk+W2d4B9Tx2aUBqr9rvsu/wL/UfwnUuH3TiugL5Byf51
	V9+RmZh8CSPwmCWaq4QLYeE+6HObVKxHqotLmLSYwULWmJakxYD5cVPuV04ZVRfExzbjEVuK116
	IdIstuLWjxhp4kv6/R3ksjnNLJAfu1yPIZsK5efDxtuAn7viszPt0TmgSIhGollcV31LpewnUiC
	5bPKLNjvpj7w33FMA5F/Cr20c3NyzrEoZTOHQa/TNnSUZpUUpH+OV7o+T86hysohuhlRunP50Xq
	0APonDWsy+rGNk8dpTSPEyHIuJaqqtOQ0HlVoCfmea17vH6GiERcvYjI6gEWT45Cvi6N66kNw68
	oEWhixBNbQsZi5zljzYAzA1/Q46H3muXZgIqw1VAq3uxh/thVxj5CG+nH9cnciUnZuInrcDZ6Nf
	AwMY6f48iyca+fClWUHVwwbk0UBcn1pYrukGbaEKhRXyAKU67GbqSTDUTwad/viu0RGmH4GsPw=
	=
X-Received: by 2002:a05:7022:4588:b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1a94b852aabmr36592212c88.27.1793778132148;
        Tue, 03 Nov 2026 23:42:12 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:11 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/2] usb: typec: mux: tusb1046: add HPD_IN override support
Date: Wed,  4 Nov 2026 13:12:00 +0530
Message-ID: <20261104074202.76712-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

For boards where HPD_IN is not asserted by hardware, the TUSB1046
allows software to force it high over I2C using the HPDIN_OVERRIDE
bit in the General register (0x0A).

Add the optional ti,hpd-in-override property and driver support
to force HPD_IN high when DisplayPort mode is selected, and clear
the override when switching to USB or Safe mode.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: document HPD_IN override
  usb: typec: mux: tusb1046: support HPD_IN override

 .../devicetree/bindings/usb/ti,tusb1046.yaml       |  9 +++++++++
 drivers/usb/typec/mux/tusb1046.c                   | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.50.1 (Apple Git-155)

