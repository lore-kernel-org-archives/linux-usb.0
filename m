Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E88A2F6586
	for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787656518; cv=none; b=GeyC0/3ZcDGPVjYScZPabsPRy3uVHaWDRtAaIZy1b4N2NvgZwbspHgeTYJ7j8NAYWcKgDEfi9PGNfsk4DZklce72Cmb54BxGYZqHTU22GNdjl5TOpIZLGTmTVNtscEMy8Ps0VLtnikyhqR8tnsfb70Ys6V0BexoyTBaDZReOnfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787656518; c=relaxed/simple;
	bh=GKN8g4QDBFDef8bKiPT7Dvw3NomvdxmD3jUAwR8N0Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvuox3+/tmReiyOrGHMW/oMAa6FzVs3+L7mPYUYoEG6FOmrUzNtsa38+GGNzrRnxhOwoOmEfWLWzcNwlr0Dz7f0brnmLrS01a0sxqwXOYXvqURGelAA++JxHTqvWWHIgzzXQHAgilljtL7WLKx0K9ZwL4sPVY7YnWjwpbN3lnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMktEPZE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMktEPZE"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so785661a91.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Aug 2026 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787656517; x=1788261317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKN8g4QDBFDef8bKiPT7Dvw3NomvdxmD3jUAwR8N0Mo=;
        b=HMktEPZERGupv1Sa3dsMl7Pkj3eIvvaB7Qmt2XPUQGcA8Jk0M9hdbYGbd4NPGx6Rqe
         EfxBuDKV86WDzqZcZZ/F5C18ilxTlGTRnm3r+3mEeiGWfU+82FR2zQXt5KegptLRRBMX
         /VDTWjPQbdURSMi272bYEj67Yqb835FltgV4TOCxLMfANye/bja8PrD2qBvk/xizMN1W
         Vv4G1MABzwQkaaeTAdh0MkCv6UhVcWjTM3Dnda8IW8wPT8jlOsUFkb8/ECvsPpz8EMDH
         jzCzpS58X4GKvCxolp9xuM4l8WJ8I8biNj0r8ovUhOQZBMFOihL3qqMGsrX4+HwSMmhm
         gfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787656517; x=1788261317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKN8g4QDBFDef8bKiPT7Dvw3NomvdxmD3jUAwR8N0Mo=;
        b=Ntc7XTrhYNlwUYPtt7BaG2jVE2n5CAXwJJ7dShZXCzN5KBxZ5aWjFuXLC7ZeIyJPSg
         0sMO4gI45L0uwqbU0WzF8h6Bx5BXER5+YSw5QLskpb/psjmOppQeVlLsBrvEj5/iwoyo
         yReQSQLfOMW2PX9wtHddQdD4DkEhKVnDB3QJQXCpK9cMhavsPPBSGswF0M3VZNFDbZu4
         12SaN2oYT5uMc8tu4avieyyinYmNP+1IVkZueq1K7Fuq97MkGU7n5Zf+HsTpQ+rU7bMh
         wKZURxIOEKPR2oTQ5AsOw60i22yEIq7URbV04Yqfukud8oqjNmQzfLfjEh+upA8ADxy0
         3OjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOKu9raXy6Z5Fdm4FcigCi+qb0pNmz2stUzngrMlB4M1VnDzp7jpBNRs8pbgKu/uYsYq6anGlbn/w=@vger.kernel.org
X-Gm-Message-State: AFuF++m07QaZZqQf9W1Q50QrZ1Ok7uPZu+c1gMWJT6JK7TfqxXtmp+/v
	4xWRvUpyEetuaxd7P4g3U5NAv/utkUvCqv5hBrZ6fu7u4xKHNrIg42X1AhC0g3SZ
X-Gm-Gg: AR+sD10PI3ofNOM9O72Y/xL0CH+ZYZXy0iQC4YsxTqN6TQL0ua/6yhiREATNA7G7vIv
	ySYmqrXCgX+e/r9WOnBn6P5HGjA9NX8r+Qnb7Z8BpjDugVl/bajXDv2SYaS5aSsu55Ssu9mNOXo
	WhD0uex4cwSp56sxA0vTGJ8zV704MPdyAza9no8bqlcN7knUiUZp7LXP8X121BHf7u+657nfV8K
	kmM3u6EfGDuOQacvPOMgJojEnbyBj2rZANIIzA0jP1c1K2cV8KkCAzxXahpTZeEpuOMy0EWMrit
	wcoXxNIn6Lxild4ymBu8IdReLgQ8Z+KafTpgTi5tMxpLTAeVFq6YyT0Z6Pxd22to1XuBf80bcA5
	Olu54kpNsx9VyUm3AEdXetKnfHCk5EHzqXSRtrbLCp2q7V8q2eE7Aj4jsB1LXXmhMZGMyO8qA4w
	TMbwrZB9eayaUo/cyY+4n/RcId+biTXWk7FyseH57E+9khd/vhDe/6+GSoSF26JETHDm9ipBldS
	ynE2cMsOBgE1e+R3Rq17YAjc9XpOqBBoLCRdT8eWFc=
X-Received: by 2002:a17:90b:2712:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-39645b19ef1mr8212048a91.17.1787656516295;
        Tue, 25 Aug 2026 04:15:16 -0700 (PDT)
Received: from localhost ([2409:40c4:101c:e5a9:a28f:e499:1b07:43b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3282afb407bsm6628824eec.30.2026.08.25.04.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 04:15:15 -0700 (PDT)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: lovekeshsolanki00@gmail.com
Cc: brauner@kernel.org,
	eulgyukim@snu.ac.kr,
	gregkh@linuxfoundation.org,
	jack@suse.cz,
	jjy600901@snu.ac.kr,
	kees@kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	stern@rowland.harvard.edu,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] USB: gadget: fix NULL pointer dereference in gadget_dev_ioctl()
Date: Tue, 25 Aug 2026 16:45:11 +0530
Message-ID: <20260825111511.328160-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825104601.315401-1-lovekeshsolanki00@gmail.com>
References: <20260825104601.315401-1-lovekeshsolanki00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch was intended for a different report. Please ignore it.

Sorry for the confusion.

Thanks,
Lovekesh
