Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45B52BE7A7
	for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 00:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036268; cv=none; b=PUiJsQeUx9BnhwYun2RonZ0PNCj0oPozo74m8bMfP9dzQgPiKH79Avhi2qwTpJ11KwOhULtSSTL9B0LlBXhtamDhaoL1VDCgXbKLPcl/tChlmCiFHidOyK4TCwWF7hNnmUrfbDTd7lMpymWIagiRGCgNFBvLKnXKCLJrbFb6iPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036268; c=relaxed/simple;
	bh=u+qYaHk4FhI6AKTBtEqajiVbAdcU0mep39YThATDWfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RsJ8H1epCcvgYwt8L6sOMZtJflew++d+QYLK0kplvyKupfXxzap6hcGuJuNES4QdvHzfKpiO11m+mT7dbZU5pY5TSHWKq6xD7QwVkMWy3zCvkLVO5k+C5krHpTRt7X6VU6PMEeOlxr/F4rmTknRIfOpFUV4VSTpJ6K+TxfwVpTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWJZI5nE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWJZI5nE"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f6so23070415ad.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 17:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790036267; x=1790641067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q01jEK+Fv5Yz/6Fpb8bxfLq3szcVIomFVIfW+quCfqw=;
        b=nWJZI5nEbRrjKk3hU8pA/OWlhu6UtEZMbZYxbWaezroCgBFrNVE/2TPnF0DNEQHhKF
         /v4zGsqnvAHjrT/Z2IJP65Fox+GPINbNEU2E5eGh+M0Pc5ahPlpQ5I2EJav2s7cL1g9q
         iFbV3HyyWAFUFxrdgdviEAy5Y7X2LA68pzT75ExYQS9h5wixWTLk87YsNkiyM2xlAxmX
         VBaydJh4iVET11ZFna/A3LebHOiI96RhV0hoWXEyo8q1ff+qNXHFbhkeYkNSg8lDE9j6
         PEKBSX6riQCOyDOWXYhjYfvsPGTH1YA86PK4GSumYNbW720AKW4XfdJDXvw+IEr2oVMp
         fw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036267; x=1790641067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q01jEK+Fv5Yz/6Fpb8bxfLq3szcVIomFVIfW+quCfqw=;
        b=ORy1gblNU1P9PGDr0Ghbb2PREk5HF7GAyNad93+xuztWq7ACTpiDA4oype+ZfodY1c
         c+Ukwf0E5Ur7wdcfcu79mygsBWcX1ZlxmD3At1Jor5UVFLTls6p25AJ+MsbC6I9PI682
         o3B8258+9p2JyN6p8ktQml9RUueX9we0YxXlc7auzAqEJtaEhGIr5CaoFqpVE5IB5ppo
         2sLKy7RkrFmcEFEEYmM28OIH9ZJ46tqyjr9zPr2vwAGfuquAnlPRfiG29qwgw4emjcsH
         /5tB2zAhS50iadMAhaeNmfPAIMhpFrCsfzYQ0t99UpoBTd95bbjPnyegqz4UchukMdZS
         Q35Q==
X-Forwarded-Encrypted: i=1; AKwUvBxc8dcxUAr090u5rtrYcH2WspvFaNXrOsJpqKjsnHCN4pWblSF5BJiwYiMSZ+y354Ih7mDX5cCnIpE=@vger.kernel.org
X-Gm-Message-State: AFuF++meSlqDqMGe0iQAwRVMbepfK8zUFSkHm93uTY8IeTptSLc1Yuil
	AYHTwKjgvdNHKgKwdFN7nnzeN0W6ceyxlqlqdkwMEE9jFDsDGbTkbYbR
X-Gm-Gg: AYBFou1UhidhzbdIO4kuX175n1o2VrUM9GhPO069O+mvfWeJYj6NPH/rzEQFvBJb2l2
	kBKT8IOmZLhWKuX5pf8rM1rrOo4jucePehGtZ9s7IKuRL87QgnSykcMTR0v8k3JOOOKDquJcMnU
	Xpv6WKZKC6tU7JChVJO/hX0zecaz0yo1qlmaOq57ptzeseQPVGu2iwiJj6OqwpLQQX4ul//jWPx
	j8ADdiH2gGBILJZvBNnRV1aCLzsHwJmgCDT/9pKE0CNJruMzXLwbcg9AsPARw9sDYM/z/Xf2Xop
	5pCbMvFRcsIEWXORHyrxmalrYzo3Xe8JKgrIlGRjjfbmFhln3g3rM1hCG25xfKMiW/LxOlW8KST
	DUqanFsazYZGkHru8keFiPR8GSI8qsRl7S5TIl/mMs2QWdo0Lavs07xXdkpy86Pf83zJJ1HCjDY
	q7okwpNdZL72+YVNpP4fZpu84scs2Y9Ng2+W11hCobNcHOe3AsW7+vsh/3y9We7Eo=
X-Received: by 2002:a17:903:26c3:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2ddb16e734emr168049675ad.0.1790036266904;
        Mon, 21 Sep 2026 17:17:46 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d056dafsm512335ad.72.2026.09.21.17.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:17:46 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: westeri@kernel.org
Cc: andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: stream: Make read return framing error to the userspace
Date: Mon, 21 Sep 2026 18:17:42 -0600
Message-ID: <20260922001742.14332-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>
References: <20260921111921.3289289-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 11:19 AM UTC, Mika Westerberg wrote:
> +                     if (!nbytes) {
> +                             pr_warn("corrupted frame received, flags %#x\n",
> +                                     sf->frame.flags);
> +                             tbstream_dev_consume_rx(sdev);
> +                             ret = -EIO;
> +                     }
> +                     break;

One question: EPOLLIN is set unconditionally in the rx callback
regardless of frame flags, and tbstream_dev_fops_poll() only checks
tbstream_ring_available() (pure ring depth), never frame flags.
EPOLLERR is used elsewhere in this file but only for device-level
invalidity, not per-frame corruption. So userspace still has no way
to learn a corrupted frame is queued via poll() before calling
read() and getting -EIO. I'm just wondering, is this intentional,
or worth a follow-up?

Also, fwiw, this doesn't apply cleanly against current usb-next for
me, git apply fails on the rx_callback hunk. Looks like it's against
a tree predating the busy-polling changes.

Not a blocker either way.

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>
