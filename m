Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092410;
	b=mB2nknufJiwBKYxWZ5ZvkoY4HBbHnQAgCDiutq2LrhqubOd9KfnvtkGpH8n3MUDVqtgF
	 R4yb2imUn0FU74eAGSYCux+kU0hWYqVo/MZSwRT2LS1PASyroFFCUDE1av3YuB9vGWl59
	 mTHgNejSIj3mGn1TvKWzOHnR8LkOwc/6GNDz2SMhkpIFCqlUP31nnX44IRGJUbyMEcTPm
	 G7N5WJn8dnX6U6ZvDrkBZS/5bi/qOyguhCjQtdlrHoRsGW1of1o09X7PvRCCCzQvT2FeD
	 FaMM9b6Wm6tNyYMB4tq6ey1eB7lJI61tN0BSjZD5+4CxExsN+IIw/b978Rxbxy//M7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
	b=AvkYlAq4EqlyvPEaRMY9z+p2+rnfqo7eGBNggdqXjPz3yPGabq04qxSKFz5RnEFpP0em
	 0YkcinoxgtqFSY/4k4pJoQD8MDyBCcnujGREsmRRWno8c8eRAPx9y2GlTQFe+Gejlz6pm
	 b6cNc5K/mHI7yRc2Tatvth+o0vMjSXNdBtMa6lVlTddQ4vPleP46pOTqdUE8TntZVQmnN
	 G9nmjY1NZnyNUmFDDL8CSQlOafIGMcVU/XjVl5oRWUrCyMQn5XMfgchJnVzYomUJ17S0P
	 3lesIEfUqPwZk5w41RC+wcMudwbX+EHlx91uGfckSqLu7n7yAWPkgXbN2MbEhq/egHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8789606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 12:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8789606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BfVexAMX
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so3630324c88.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 04:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092409; x=1795697209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=BfVexAMXUExPA/yU1/HvoxaKMziAg/iD+IUkHNZoxPYzkEA3j1C6nIt89AbCwkXPRO
         /cce9sydc7DmUaiiD9v7hE9hgI1ZMsnDCrGgTYI/xVDxscovZXfGZjiTvCQC5CBJ4zh1
         rbfUnR6wOGT+8PMH0NHQY24Gy9AVVc4jze/FJc+s66e4NVtUg3Oi5AK3PlvSTRyjacP3
         aOwAfj7uxwj418/tukp5tVVEF/PUTXOL4hycn4H6XyLCVA0Qkw8gmZIih5yFRhBe6V7P
         YH+9n4wqb/IMKYyg+jwFOeRQEXeGZ58RtlgqVICZ99RkGTmlcRt0tbnS8gt7ZXphedba
         4iGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092409; x=1795697209;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0SLI+cpRuDAPpaGNRcRyZsjUAuV82ogqilF0+QTbgo=;
        b=WkftHJ5mUFmwtpku6CyowTD8XGtoxMMmM0COoP/yBRwZtvO6+3PqxQ9Z7mpHIsPoF3
         w2Jmq/BA/hnHtYsH+vYnnnGZLDYUUG6eOMKm33Tdhfwa+kIm73LBcvUxVHodc7dJAIwz
         aUG0G98kvBZlWGV1gKq9/ZOhOsk567z1inTo6EUBpQt/otjOBD+561yeKwTIS/1nNRSd
         Lg9YvwmVzpWD3q4JmTlq7haxBh1woewRdHnogoFNh3tScY3N4U2t8vmgLMiyjpnV74sA
         CJxPfAhpMywEnoDkHGCBXRc4+BKwxwmOI6/rPmu4ux2xDBmvIUR9986/nIOFEI1JE+QV
         G8Ww==
X-Forwarded-Encrypted: i=1; AL+hErGVywc5Cq9YHUXeBXgpXhJzwq6Ti5bODAXC5FQfXndt7d1xVEEXJ3y1N7bgDeTUofXxWpbLKB37gto=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+dTNIU3OXJjCncpW36UB/x5kraKV2kzXJZnXr96AIashARJjZ
	8y8/CfnbrySK2t3c/6oRz+ZEiZeqaaUWcUmvAkeiFFBMqU9675FK8l9B
X-Gm-Gg: AYBFou0SX7OFKRpO28y65NGaIJMrIkFdL1f/yMdqoqUtuOwX94xv7XVyD7m8AKUBlXQ
	IjrhxYLDbGnRfxLKZIiWOfjGn3PBspcDGvHBeKJnpJeZuhLgbuhURqswHfbpTgxKGEvHakjG7jl
	F8fp8NzLZIklYa7NO/sJQ2WpV4BCzrrgwKptpdJ0W55o9HbEBa0M83Rhb9sh59e46PP+fQCBR3d
	ZSzsa797DO3CsmqnKLw65IlV6FonYjmmfCMfp/cjg/+xxuGx6+r7LD9AZiqwWR3NwIoUBz7fQad
	Al0aGvzH8vB6L2FB84nWUcMbKt16loxlxlcUGbjAjXCy+eZFrCiEn39CQVfKcfX8QiD41kyXeLD
	ve4NuJxxASOpRjH3/BGeuteQc22M0sveJZh7/xVrfSWvEofG9rF7Xtcf+MU9yE+cBfk+wlItkAP
	9zbo01OwU/ZAderN3nc/mbHQwXEAX6DgfHeXSARkV3kpKJuAyOMMcbyJwDqS0Ey4673pidpdHwk
	mM+u16iDoTwTv+Iodl+yHvYrjBuOdPoWCPCqZYCacdnk40sNsOd4z9NlJOUGlbhhmRWXcgDv3EP
	GdcUqtrIGQSJB7eUNjwW1WI9Wmp9833TvRg=
X-Received: by 2002:a05:7022:7f15:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b543c3d7f0mr4441883c88.1.1795092408616;
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:11e:f696:8454:757])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm13868656c88.14.2026.11.19.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:46:48 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 19 Nov 2026 21:46:47 +0900
Message-ID: <20261119124647.983-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
References: <20261103135057.1682-1-26rote@gmail.com> <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 06:54:48PM -0800, Peter Chen wrote:
> We did an internal discussion for this use case, we may prefer the solution
> that let the PHY notify the controller this PHY lane is going to change from
> USB to DP (4lane) event, it could keep driver independent with dts for this
> feature.

Thanks, Peter. I kept the mode switch in v4 and explained why in its
cover letter. The Type-C mux framework already calls each mode switch
linked from the connector, and with the usual graph (HS port to the
controller, SS port to the PHY) the controller is called before the PHY
changes lanes, so no new interface between the PHY and the controller is
needed. The cost is a "mode-switch" property on each controller node,
which a notification from the PHY would avoid. If you settle on that,
the clock selection in patch 2 can be driven from it instead.

v4: https://lore.kernel.org/all/20261119124558.1548-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
