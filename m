Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D817993
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787396809; cv=none; b=kdAXQSTfuXSXrRxleBv1luzLgil4OlsZlZFg49xWSA3PWFMVEu0qml01ODL720afVnSqX6B9e1y4C990/nkrl6/hHfS0H7FUWwSWuOFqT0k+IVw5Hci+isuwdoVPcU6Np7/ZkooXtWCvJhZZsTiDOZti66qT41B/hR99iBQ6zN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787396809; c=relaxed/simple;
	bh=GTWY7bj+1Q9FhEfIw72PrQrUf6AnGjVHpD8Skvu2dho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K36fNtDvnGEYNwo4Z+GyMZy+bOZI4NvZLLckQEaCBv1qhJC3mge6IwOjTAbTBy6GeYI+1pic+0vly9c99D7sY2OJQfmTm/S7ZU1lezmXrqlSwS/HrsLAt37mvbwJ1Yj92yUjehDLxZ0rtG6bI2BUanUvGIKkacOFgxQD4pywsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/JaMtmV; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/JaMtmV"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-37fb1883fbfso655657a91.0
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787396808; x=1788001608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTWY7bj+1Q9FhEfIw72PrQrUf6AnGjVHpD8Skvu2dho=;
        b=X/JaMtmVMySaosZUT32eXypSH8/iu85a6V06IaySQsZH5cT/JRRvO6ht8JbQI4Cz+s
         s3PNiRZt0AWO7N1wIgEjvSAEBxiSQl1mfbXOwOceZJQwFNwFLwm/S9Qj/nR+YHaCbEh+
         hPpUxl9vUu5VHzdG656uCTDGTQgTYgGYjxTq2Dnig7zSSXdzn4x70T8wUXvbHkY0/nKC
         fmahQVWWhvY+TaXLTp0UNFHrHvkmYt01UVaEzt9Jqsnc1lVxrj+J3V3tecEeBzLjw30p
         tKefpqEo62N2872c8O69xDzNV0HDN7+5kGeHC3KxxT3F+yJhHCEHxMRJG0lpH1tHym83
         TfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787396808; x=1788001608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GTWY7bj+1Q9FhEfIw72PrQrUf6AnGjVHpD8Skvu2dho=;
        b=V6v+HmeR60lNpMcM0Q+3Elr6o6fA1kmyPjAdeoJrNVXzF3TV4shl6BCuFoW00LonPK
         2KwFp/T/cqOfiDvQcIzj17vjR0IXnAtZn4kE4zW4Ar60eIeDE/No7QcUMy1UtFICcfqg
         0lLCeJLTeZ26a8340Wiz/CKSru0ZgGA87hIbdw+0WKVQKHB9Hx8rjVBvcoUFGCWuRbrt
         hmN79yL8LXgOJqyvSQ+cv+rBINyYbDkp5xptG9XKDxAUKORPCBSec+/jos2LOYGpOc4d
         agXWCDqwWfeGvSJ52tQZPHO/Mc2crN6mMaWXkNScGOfjPWoP2QeAqdIEJ94yBTULBDo1
         T8jw==
X-Forwarded-Encrypted: i=1; AHgh+RocUbFiSiqobBI0FXwNeQGK4KVgpqGIDhb6tMJkyAlBlRYXeuZMijy34c+BZhc5YdczGFk/GTnWBa8=@vger.kernel.org
X-Gm-Message-State: AFuF++nvdl0OwZ5kDkHYvAenmotfxXem9gGbXK58pFzcOg1EXj3K4m7I
	VQ/WS4+qCz7jregrCldn8xXF/6AbDaGiAjfUJziGSoKVH40KEzAjqjQF
X-Gm-Gg: AR+sD10+5gdenxiPu2sMod7nQN0Vh95F2J8pbMnVcoLEUnTGXPCSdPLB3nXmi53hRNh
	6JourON8z+UsREwnpE067Nxh0no5JYX04MWHi3+8jL+6qdUyufOREVgTpNOq2sKe/NzwwT0mpmD
	ExjIw3GZcUxS5y0ya6UGWF4JSMfaLAJe09DA5xaWlMxBFLoI4Uh9+Adm6lv4cnw46Do/0VKgPXu
	1AZdlOXq8Hu6GJ8o8wwfy1n9c9oCH/d/46I7GCu+oERVB6xKlvnGiwMGmb0lmZdF3hzh2ieRCbs
	d3iM8hWyDifh1jzniLAnNr2OmO6gHV+a3iN/46Cx0xgLyLXnMjzt6VZbAHgHLYE6Tt4HxesMj9H
	/N5TKfjKT4Lcl7rhhBEIMlKI+eK872bAGQF89mlBMwZSVzVMVB+XbVm8ZTzU66pD5AVGBf6U5YB
	x8Xr5eXiSZByJqRLm0Z4U3SbHdLo5OEk2RkVKJJAW4uj1wBO3EjcTMc+wrlBfFy1b44ifSwYq9W
	GbwpAqtXlcOPrmTCREEZowEUrYJFY2IPV1GnPY33ScIcvdp+nWQGE66Tm+Lck3oIrwrx1La
X-Received: by 2002:a05:6a21:3418:b0:3c2:dcdd:a85a with SMTP id adf61e73a8af0-3cd300bdca3mr26376365637.13.1787396807923;
        Sat, 22 Aug 2026 04:06:47 -0700 (PDT)
Received: from erdaitian.tail85cd49.ts.net (2001-b030-a81d-0a00-0000-0000-0082-2410.hinet-ip6.hinet.net. [2001:b030:a81d:a00::82:2410])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155675287sm3751313a12.20.2026.08.22.04.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 04:06:46 -0700 (PDT)
From: Tianjiao Erdai <erdaitianjiao@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: validate CAPLENGTH in xhci_gen_setup()
Date: Sat, 22 Aug 2026 19:06:41 +0800
Message-ID: <20260822110641.6570-1-erdaitianjiao@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082252-segment-haste-2eb7@gregkh>
References: <2026082252-segment-haste-2eb7@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Understood, thanks for the explanation. I'll skip driver_override
triggered issues going forward and pick bugs with more meaningful
trigger paths.

Best regards,
Tianjiao Erdai
