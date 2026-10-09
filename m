Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8478233926
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791514977; cv=none; b=qBnC9mF7Bj4LYitBDdcRO6TQsA7qG6cfHHn94G8KFIdJBS/7PLZ7N+WkFjD+rC/ABndUEid8J5Yad50gA7fD18zYr/JlLpH67PcmhbV8gmpLQ5j8L3XMoxhUWr7EFx3wCHe9G+BIsDtSh0bmmJf52URu23u4uiAL0y0S+YRceWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791514977; c=relaxed/simple;
	bh=Fib6vVoBWiy7h5sMkWAnzSSnR8shSih0PzJBxLPwTr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmOSp7ct71VayMIyYUYkS/qioUJ65UHvf4VUEHtuSa+dQA8+fLXN5qXMVZyg6C2TEjk1ZorQ7Muhg34jIjKQZq1pOl9INJJFERjtNouB+7lXvJJnCpw4CkJQCSRpq67b0qddw8WpNX56hBJAo87dC/ko/ZliOLxY/Ec4+VTKjkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFHiXpgZ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFHiXpgZ"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c8386a01b0so1861296e0c.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 20:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791514974; x=1792119774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGg/C2FOmOXK3waNV4NEmvvojzhvyFQgBWsW1DGVkpg=;
        b=gFHiXpgZ2SuZ2Sn3/GAKwFuS31YYuoDw318HA0qbzTbEXer8wiBO8P0VrMI6h/nBe0
         4mIL8DCI5+SNc3i0Dsd9aVGcEX+eBsj6W4zJvt54hiEGLXV3iD8c5RhDhZaIZPxQfQvU
         gq3hLu7RAcH/57Ts+u5nukBXwHDdMERz7PZa2vCcF/+N+SfKHx5H2uSJZ+1N2YW4FHsv
         wdNv0jGh7U8Piaa/2TRnNZ+0UwBfrd65BZKcDie3UmbXMVUIwI/6C90esUQagbxhCqPp
         0RvtMC+7TcgX86sb7PIMeTRbovw32aW2F+qWleFT6qMWUz8PRZ8dFbFQ//FLs3YpNB4o
         2lBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791514974; x=1792119774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGg/C2FOmOXK3waNV4NEmvvojzhvyFQgBWsW1DGVkpg=;
        b=Yl6/XVj1K/gcQemTds7akyr4PGCHTky6k1O/Rsdr03C33rdDVlQEQPPar0kHZkHzRU
         rnCDk3IdJhtsq99lEIWPY/c4+dnuvzBxfJ2NjB5nDltvqnZcs2giNgssogSN9jG+OIjW
         vw7c6kYEGObwcelhb8RW05H7vLEowFEoYAHYFqIRe9KRiFsC6XvwkhRYqXGSQdrFwk5z
         V1KsubC69KaqBqm54hSKNe1hzfUu6PP4Gm4gS5v1kOPKpdtwF3rIpqnNnV1ev+kv2cF1
         Ox0JSTEgL/gRRtk4+Rb/oDXuwVVzcZYD6l6Coe5hsUYWXs/V+Tlw49JFtFyC2ifl3Wt8
         2XAg==
X-Forwarded-Encrypted: i=1; AKwUvBwVpEuajzSXjiOSN/8Lk+zfEc1XzDUJMFutkLULbIYgJws6tidVrNdz1mnq/PSaBgzMUptklVxHAdU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHQXKhgCiGrrsyYn1zel1puUyQCJIyS4aIozU+nVikiTkXmqnA
	uoA3LoFIVItvy3Ag+DcRvWCTNMcyUX+qygnTv4m+8vJ+5ekUBdFgD3i0LKFq0DEOpNRpHQ==
X-Gm-Gg: AYBFou3rp+MOzWlBi7mvOd2zuSdjA03iX7va1ZCsSqxLIcFML+evayGPg2atDRcqD1U
	GH7Yn6CQMXBLKmz16T6yPWNnWN2sDY+Wg0F5bLP7nlb0e3brooS9B+e3Pcc5YbTnySbZ3J8jRa1
	W3DiVIpisVzRrIp7P5LA4b6Jy+vaJFU0Se6xqwqby5AY0EF4PJd8wClNT0Wvx8JMDBH4ry6KO6+
	ByjhdmrTobZirllv4vjoOffIhenM/TyIx3rmcFqbeoWVwV78kKA3qI9vzg9Nvfoz/4T+zFfz515
	Sv+roD753/YCJRplVijGO0y3vz6bypJvnaqbLRJ3dQBymzhKLJkaxFkjPjonIf5WAq7LElomeEM
	AzLiUaW/M/C9ULXfNV/fucqIJYFfYBcPrQh/yEN+TWqffa0DsZ+oqdmGBk58VoKsc2itBTlmV3a
	8QivGLcAFrWV9wozZ3xTDZOPOD6dENEVQMg+wmcBSkjnYtCQCQ9vCVwCYx8PEpOZs=
X-Received: by 2002:a05:6122:4f9d:b0:5e1:c1c8:9ff9 with SMTP id 71dfb90a1353d-5e91f28cd89mr189593e0c.2.1791514974562;
        Thu, 08 Oct 2026 20:02:54 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91c841a45sm794987e0c.2.2026.10.08.20.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:02:54 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: composite: pass the validated interface index
Date: Fri,  9 Oct 2026 00:02:44 -0300
Message-ID: <20261009030246.3057189-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915040947.2829612-1-qwe.aldo@gmail.com>
References: <20260915040947.2829612-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Friendly ping on these five USB gadget patches, all sent September 15:

  - usb: gadget: composite: pass the validated interface index
  - usb: gadget: configfs: zero-terminate Unicode property data
  - usb: gadget: f_printer: use the active RX list in soft reset
  - usb: gadget: ncm: validate NDP length against the NTB
  - [v2] usb: gadget: ncm: validate the NDP chain before parsing
    (v2 incorporates the cyclic chain example from prior review)

Let me know if any of them need changes.

Thanks,
Aldo
