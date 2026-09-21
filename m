Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528E3C660C
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032138; cv=none; b=YyFdzwM8JEMNcRCjdn+aifHq2iz/6JusoT3LumgFg8AU6LW8oE23rVm+IBeM9CzeAjlu1sXCE2++M7zo+Vghxsctzs/PqbwGNtdzIPxn2DB6vEY0ZXQd8EEiN005aXok7LUZBZDK9rqOhYtiQqfAWv4/0hC4qAJc/T7qMaFjsUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032138; c=relaxed/simple;
	bh=FjE6m4Wu22yRUqg3eOb2AwP40X2TKH7xNOyBefmJeU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8BR/4jeNB6bSWtwNB/i6qjm+Xm/MEAhdy9YtpJ6+vFt+xF0g8I2RPIFwCbnYg4mYVByfzjBO7+hNR8xceC3j8JmgHceLGXQlmtxw8hryyA5kNTOAjsO4m08jpBtv8lK3hKtaGNa/smAa85Z/rI9ny3IfA+Aa9QQa6cfMWOwg7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4E1Ym6e; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4E1Ym6e"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c7so333354385a.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 16:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032135; x=1790636935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+7FtZo0KfJZuE7MAZ0TFcA4sMr0zM/AKrTXBM06+cw=;
        b=E4E1Ym6emMwVocXYNi+rPgWOOJKOZ4J06QPIFyy4mPzFOhLXcdda85G8rlxZQxQTtv
         wIY+2w2zm+vfv/7DdXkF3MAh0Iybkc7bEEv8gj19wEHBD19srwDS+ueb4dbxcWZcdhvz
         eq5DwOrvSLQ8x3s6S/7aOZp0o7BNjLSgb2U4IHTwcsWQRyySoazNHDynQILNlVLIJ/dV
         f+vI9J9PctGd0hv7pNUuOV5C4ulykOknlLzx3heTi8knqcfEu+z18aqdibrLY//bEblO
         0O7jsirA2TiQEYy1e28J81p1BaOD3swJZD1PCcy21xYWgtomwimoRzsnBfXo/mXJpHbk
         ZOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032135; x=1790636935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+7FtZo0KfJZuE7MAZ0TFcA4sMr0zM/AKrTXBM06+cw=;
        b=0lJLHL9HAgy47sfageYA9ubC4VaGScn30ftcKhCKKTIQRjHL+ZvxBQ3QZAxdwQdKL6
         xvOjVT+wEzR/tkpKTUP8FT2KnlOXzQjezD611QxbwVsVbIS+MDsH1Gq6MRtpe+bq/ZEx
         m3ErGIxy4q+mmu1FVXJEC4TpKWEKtL1mj0E+dpqa5KszSLxYE+V6Jb1UNTitGrYPJILa
         gkbMlwkqh1k0gXkwTpY4uuoTUEaRC3Tzfo9k53BWK/Lu/j5mqq86VuVxqusC2o+/cqpA
         vqmQB9JcTAXc7/S6FIsyzkB6fn4vTotoRcH30h/AodiSsN41Rqb2ocEQC6OyjjA1weoH
         0mgw==
X-Gm-Message-State: AFuF++lUxx+msvxhWm6DVKxtLFYQjCL8RQevflr+xlbcz7AivsWBWJsn
	zoNvnyuHOjM88Ea+04U2hk/0z6Uo4zoPeuaACxSAnay4fFCLn7YanyI=
X-Gm-Gg: AYBFou0tIv91VbB0Ju0Cp4QhVfrla3X5X+r+dHKR9a6Y6VJUWq0mBJYNh3rdJvMTQAB
	ucEu6GC+RjEL8BkyNBwu4UUitH7Db1de5YUJ2OpRikJkeVcqAR1GnLceGiHU9axHnwaIuIsWMFM
	S5KLQDij3fU3medaLCfXDLcVW1kuUA7oEV651rzipE/I8HTj9mGOISXFKbjO2Gk0ahXl1jnVMxQ
	pehuYdpToWdQrLKoq/x+7dUcnyxAKI1/2sQzkDqGxOW4/po/QoFDczcPvogqAAtAhgSJzTZCoHA
	vd7ycBStSTPp5akbp4iVO6lNlHTL36zlPvwulZW0LyZHFFrDarB7QzFKqH1M93UxIbSFf6QQ9n8
	QKvPvfg3c74wVcOFB/Hh7F769UOTi1RXCGPMo23uRO3K/cvm/Y9XI30TaNdOO09T+toaaDkrI3j
	YXB0Yo+0lcfX6Imad5SAt+YZebvWqMBetA6RDmoxtRzj/i8R+en3/7IXEZT0VfFD7hKh0twXgo8
	LiyxOsrvZmbiznwQJTg/cMhxO3Bu3bRTEdZKtLMUr6jwGjmw3PqA+9jyWMUNHEozIDut8nR5Hod
	qVR0xGH/9b7GX3gseuH9sYcKQSc9
X-Received: by 2002:a05:620a:4008:b0:939:6dbd:de57 with SMTP id af79cd13be357-93c198e81d8mr92373885a.32.1790032135435;
        Mon, 21 Sep 2026 16:08:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] usb: gadget: tegra-xudc: Fix removal-time work races
Date: Mon, 21 Sep 2026 19:08:46 -0400
Message-ID: <20260921230849.502492-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two producers outlive tegra_xudc_remove(), from different commits.
Only the delayed-work fix needs an API added in v6.10.

The devm port-status IRQ queues port_reset_war_work and plc_reset_work.
disable_delayed_work_sync() rejects a later queue.

The PHY notifier queues usb_role_sw_work and is not devres-managed.
Unregister it, then keep cancel_work_sync().  That applies below v6.10.

Changes in v2:
- Split the Fixes tags.  Only patch 2/2 is marked # 6.10+.
- Keep each Fixes tag on one line. (Thierry Reding)
- Disable plc_reset_work too.  The port-status IRQ can requeue it.
  (Thierry Reding)
- Unregister the VBUS notifier before draining usb_role_sw_work.

Myeonghun Pak (2):
  usb: gadget: tegra-xudc: Unregister VBUS notifier
  usb: gadget: tegra-xudc: Disable reset delayed works

 drivers/usb/gadget/udc/tegra-xudc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)


base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

