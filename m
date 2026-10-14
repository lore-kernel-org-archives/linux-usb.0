Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7766E4D9552
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792018847; cv=none; b=JQPG8A8M0KaQBieBJ6OBae2QWLuGLJn/OhRa7f53tAlIBpnYqzqWIGRs6qbc4uhvaxPwbCVZsXivjSj1POZzHw+M0PUjks6y1KQPJxpKkUHNFmUF8ifB8YifDYOwNwfr+RqIIR0a5Ot1fUV40L6Lz2ui8liHqEawuSGoMKAsthg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792018847; c=relaxed/simple;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ix2Fd5K4YY/LRkHlJB/K46/LmX+QDBuVF2wAQ1jeYczA4HME1FU7B1dm+afqlyRsWIVNLrVDyy+JA/EPRzntNFM63lIA18J533bVNQ9fpr4u9d8ELctWCXrNqW4nmWgsEunKYDpC80xEw0vhyeJVr6NKRPNDQc9VDs7PxDjli8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jt8+wtSv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt8+wtSv"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48870973bddso2774972f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792018843; x=1792623643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=jt8+wtSvp1Ej4wHbT5h0YMJUeMhws74la5HjvtU+klQdXWw5SmZ0fIk8aTiTEjitN9
         FR+GUOPTIx2pzKL0kKXUvrMrcbhh0amj8gZCzZ2COoCFS3J0vAREnQqKYxSiLiP6+v6t
         6xmU9df1SSimyOB6oD2qU8Jtut7YhN69fnF4dUf4Mu9z7m+lXJZwkds0l4oAlCv5hVM3
         ABDDqmdJZUVoOs2YuF8y+S7QK0XTbUDNlmEyvNjmW9pK3rl+LfkbnLlslGfiWIpMLOch
         HXNnmH8f9Oxd7Nc1WwS1oEz5n8hSUBLIaaaEA52+Nnz/81OgQAWZgLYozQVm+tGRD3DX
         d2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792018843; x=1792623643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=GsVEMsf9qrOQ66zhCXXxl9oZIVtRVZGjRy60kxPakpA0s8PUnzZk8rG5d5srkw/f/d
         O9uQry01P/DQSPVZzCuLJZR33/aBmJoTQsTXlemvpAK3oh7yVxMCr3/zYeYzxFBZF8ej
         bIYVD5JjztSpgWRu+qgx9lJwJzGvzKEVMojSaiaWdQo/hso8HcvCAi0CWLdw/ObefPUo
         ZEkGVx7lAunK6l2xr+/E6ooeyUJWNA/+tSZKPCsR/gSZHAaUP/F/DCTI3gEpUgCbL7xR
         oJw/R4U7GzkSr7tnGD0fd2Du1ueT9E9WuBEiufAuuuzt+4A5IN6FKXHHeaIBKKYE43Pm
         sBpg==
X-Forwarded-Encrypted: i=1; AKwUvBxljyh+jaNbaZWZx2djRbcpgk6OfTEZNZZ+wyXiJN7ZxpxQRra7/r8hsUgiL45zs4CcDxpl3P4lGfE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7zXxykXWThsDjPHHPqpDb7evxnKn0cc0bjSdCVf26gBc/AnTT
	yxmCvuvB/AcpMyt0gWcnc4btyvWIKseKhOhFl9260J6iv6kBXFG8Qu24
X-Gm-Gg: AYBFou2NKCj53QjeO8RgkUJuPcHwgOS0Z7OlnaYPxA676gSF4HEWnM9fAIhxAPMOOm6
	iZF0egHL8dJHyQ/mlBzMh0J1W40sBg6OVr+t0ZiDtlXeEXN5mBUZ+74aqj8mHlj8rxTJrhf2mlC
	10G9z0lhxM3munVTg2z1G7tjbTRSyaBL333dlkg0tAvVi+5oFF2U/0AxydwiqiAQtWIkPSwjsd+
	2+T3l+Du/+3cNveSC/IXjCj4ujcysAje4VHrPNXYbDtNVmLvgcJYi7Nxy38g/wuEaJ3WPCRX7tt
	6QnvAZtfPYgQT2W++zTNxCLDmplkf88gXtDaTQ0SzEQB7KdhLIqpXseS//ITsWOJX8RohELe+aJ
	KU9kD395MnUv/r8RLKrOcERQt+jMllX7h4csQldMNYkyzIPDB+eT/8C0Pc6b2ZorTH8Q8UKd/7r
	2aQJqSbn6a5BF60h/oU5NO7H2kS72TDEVlr+45iD4Qj/Rf3dfqUwkLvipmqalK1wQu
X-Received: by 2002:a5d:5d89:0:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48ded0e6cc9mr6634802f8f.4.1792018842530;
        Wed, 14 Oct 2026 16:00:42 -0700 (PDT)
Received: from beelink ([186.247.161.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ebbsm14231065f8f.45.2026.10.14.16.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:00:41 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Eduard Zateev <hackerowskiy@gmail.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: fix use-after-free on umount
Date: Wed, 14 Oct 2026 20:00:25 -0300
Message-ID: <20261014230031.3222107-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008003955.1191-1-hackerowskiy@gmail.com>
References: <20261008003955.1191-1-hackerowskiy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
