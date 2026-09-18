Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD236B05E
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722700; cv=none; b=o82y88MIE+vEZRAyZAwDiHWXli0UAKHMBmjfCJLrpK1gcxkkSV3nloHaj7hJHjUnU5+/FYY2ZWPWkD/vFsy2WMFNQj7W71eud5bAYwX3EyXIIYNCV8i5mMQiwLbmF0EmF5Vi3WcsZz/axdtKUbci0C/rsrhn7C2O7Hi9GszdD+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722700; c=relaxed/simple;
	bh=wAiKM2GbjVAaJOG3T4th+tKZWnW5DbfM/sH35qLt13k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUHAva5VvvUOZAeBMMhuDx8rer7HlAYJ5E8l+HuE3kiHReLJBa7gyS0u2fLJYSJSnw/TLhEasCsaoL5oWXLEf/Lvv9ZLCyn+WuAac4SPIFoevM/akmh5zDEc3y/v/ii+gD1lfgU/5MAlijblND3/wNTYAi6NgIdpbv1aTPXu3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpCwDl9N; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpCwDl9N"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b0dd3e1d0so110435e9.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789722697; x=1790327497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZ/vqBSgFHqCJoAqatA3IE2jvlq836FlV9wvuCTBolI=;
        b=VpCwDl9NwhnCzL6tzt1DQO31T0MUc+u9/zaQqGPJuRlPCux2GqE9b1hLgtTRh/HLI+
         HlsPIUMSbVxc0Nf4MkFCVWY1hZWQfDu1soDTOGG3kvdn8/4TVNn49qRpMsNxKdrBd+UE
         0qnqu1bfvqnLYyS+sA1PRpPaNyGfoI9VcDBhwe5WIh6k8a3Oijv3IHAHYIQtaIGRAFva
         AaEy55vwoeCHWz47WWdwL697qNdtmf1WTnkdHBviQnqRHxzCCzbo7TXrYQsjzI/BlT6D
         3Tlk7wmRheoqqEmqsiA0Hr9GCgEswNEmJA6d5Wjp/aS9Eag7kfxRTiIYcvweOd+xtPdy
         9lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722697; x=1790327497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZ/vqBSgFHqCJoAqatA3IE2jvlq836FlV9wvuCTBolI=;
        b=RzsY3MVgiVm93corGHgk1Zo3o19cQbrxdSH2nKmIE6ov37dGo5wlhIeQPWocZL54Bj
         lENuc7OpNpQCWBd5V9Nv3PH/Y6/yTBS9V8W51w4bUrbGUAeP3q6Dap0CB87aajG3S972
         cTkJSN4cZJO+xK5NVpjL/xyT64ANJeWrBSI6V25SP3DXT3pkHu5rPukUpLETiFvhqGZY
         P8vsaOAJZvpATyOA+kHRMSXlsEDeltquekt4IuQdv/T+aZ7pr5G/BRYtllSt0dZ7Vkxb
         BcTCO5p0bfwFpcHRFhwxwrbpLqGBtVDJ+O3fmV5UtwVJ+QDMRmqVo45Gedsh7atFdggM
         1RAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdBZrc3gxN3QcAIcMJqApSWzytKgndMFuvaGudu0Te0jdY+jOllJrI/4bqX4ZKL2bETi/gE6l3I7o=@vger.kernel.org
X-Gm-Message-State: AFuF++nynl9s6iRTN6SHT92W/o9+8uq180HjZRRnzQik/F4apRGHDGjX
	6+q8XqYusuFG9UAVAqYk7bZ2/FvFcpuKDI8AwPK26qXMn0m8GGWF3wDS
X-Gm-Gg: AYBFou1QC7gwraTUzkS3RBqNqJsMWFcCPUdxK4szuVFdUXQKq4ydPySY3ZKszqCAsjy
	BfNIO2lxvqm3iWhmuogYeNbE0+sGcxXthrvE3n5zg3f/VAkfOozJEYnfGPCrTQwUZr3FXROaZbE
	GZKw0VOvVA4HmWV7IYJ8Ni6lpNCkqW2+7CcYseekprpSnEoM5fduONy9oWr5r28nIVdog17BKZh
	BEZvID30dQpIVXmAVIfYdvln+sHxMdJW6ZNiziBboF69UYeQ1eveT+N/Zu2XZGmbBWC/MW0soET
	NLwqaE6eYOY+b6gmnFpzpaW8umUVzTMWRl+i7riJB93WLHvFRzmhlxpTr0HAkXZ6B1FRENtB2gU
	d/eXcvVfJW8APFG+fZX0FJvmBPGDq6DAcgjFrr2TdkTABS6VSDS4/9TWQNv6yhRmSoUpUGQ2mD4
	SX1ZOyjbGDaqpNQyn5XgFmjVAS303+kGp7DMlumgKr633lDJdBWgxJhJuOgFit5VHj1+wVZdWPL
	LLQ7z4wZz655GLzx6d/RK38upfaTI1BS3AA1TUht9aEqnbetQXiWYTR7p9p0sI/oo+aUIqOzH95
	d9ON
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr18281725e9.2.1789722696430;
        Fri, 18 Sep 2026 02:11:36 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B829B006E521A2A508563A3.dsl.pool.telekom.hu. [2001:4c4e:1b82:9b00:6e52:1a2a:5085:63a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cfd1dasm37167425e9.9.2026.09.18.02.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:11:35 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
Date: Fri, 18 Sep 2026 11:10:32 +0200
Message-ID: <20260918091032.15593-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

With this patch applied, the series fails to build when dwc3 is
host-only and USB_GADGET is either disabled, or a module while the
glue is built in. I built it on top of v7.3-rc1 for arm64 (allnoconfig
plus a fragment, gcc 13.3) with USB=y, USB_DWC3=y, USB_DWC3_HOST=y,
USB_DWC3_ROCKCHIP=y and USB_GADGET unset:

  aarch64-linux-gnu-ld: drivers/usb/dwc3/dwc3-rockchip.o: in function `dwc3_rockchip_set_role':
  dwc3-rockchip.c:(.text+0x270): undefined reference to `usb_udc_vbus_handler'

With USB_DWC3=m and USB_DWC3_ROCKCHIP=m, modpost reports
usb_udc_vbus_handler as undefined. With USB_GADGET=m and the glue
built in, the link error is the same. With patches 1-4 only, all
three configs build.

dwc3_rockchip_vbus_handler() checks dwc->gadget only at runtime, so
the call to usb_udc_vbus_handler() is always compiled in. That
function is only built with USB_GADGET (drivers/usb/gadget/udc/core.c)
and has no stub in include/linux/usb/gadget.h, and USB_DWC3_ROCKCHIP
does not depend on the gadget side.

The same test run also shows that the two EXPORT_TRACEPOINT_SYMBOL_GPL
lines in 4/5 fix the modpost error I reported on v14. With them
dropped, dwc3=y/glue=m (the v14 case) and dwc3=m/glue=m, both with
tracing, fail with the same four undefined tracepoint symbols.

This was a build test only; I did not run anything on a board. An LLM
assistant wrote the build script and helped draft this mail.

Igor
