Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56B18FC80
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 03:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702245; cv=none; b=dcKccRrSIpzMSQlTN5dLfX5lf3WOknur6VP9dN1ZITvwM13gTBSNrEbte1n85bQ4jhWNAu32PhbpEFf4CYAy4W6ytPtFl/8eGDLavmwBrZH1kKqae3txcxu7qPLlA2Ggp/HdbuLVz/ewZf+0uv1BWc/9Mv67+U+LUyXnrsParJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702245; c=relaxed/simple;
	bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6r3AkpacvzudZWq1Y5B97V3U8oKxVuMP+plWsk6ILmXAUFrIuFsKJAVBsb48yk6129jvnXvGin/943c6c78JJhaALjdJwh4qGNDZ28PfF10vNUeNPPgdVc5CWvzdbauDQ4finFETFjMHbblIscJNEmxo0Nf+QanqFedXY1kAwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXeOBp0N; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXeOBp0N"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35611so181624b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 20:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702244; x=1790307044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=VXeOBp0NGLL2JDTUR4QepzxPPIZkwP98ChfKFuUpHlWF4r17izghrAByMDL5p7McTM
         FxiSELWVP4jrS36Nk/SagEuhRpbXGIQK21kthjfe/WLOGWAWnr2nov1XBfG9j8LjOm1r
         QmoNiFQ69fIlCWW5z2HWsXG4WIEsZ82w0iLakbnoGVP9KMXdD6r630Ob1jKLVdJWBMEw
         I1Svpty9JIPLus6vHHxF7K85EJUIqV1uHtM5WaVfYCZ5ZQvdfBDZgEoiN3fTKAmXE4r0
         1FtxCa/iKqf5ui2SrHB9I4dGl1ZlhiryXS8peMZ/MzIP8cRvYmMJo6nKZQpqJJqWj6H5
         6L5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702244; x=1790307044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=fw02NWdwy/MMpPhDyOXjepnBJnNZodgEWc3D/pz5p/VJDsKV8zYm3AvzZJeHAnkQs0
         0siLDa6BMgAD0QPyOFSq3R3MgPeqzTgNSY1EkoXEjkk6enpVHvWF7+lF1xXMQQnVG5em
         wvQ197QCDKitS9Wga/wUHcd8VwKCMRUHfVkqzDpv6iRyiQhg2GYbBJIon4E+NTwqDtXi
         +oUg/8ALl0GdWrtC2PMIY3Nr00sEAvJUgfs7sCvs/Ja1Q8HkhUJpPU+LRkr0IfzlpzQk
         EZNoeOydwx4024ZVx+vgX43ETtQSy6OJoIO9lUN7/U5TYH/dp01YdTBfZR+saTQy1WHI
         UFUQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+1HlgzLQIXRMjDOaO2cr/wG/QDNSH9K1Q+Gib8Mq0sD3b/L+V7X56nWD2rhLCgSlmgeKvGhw3IHo=@vger.kernel.org
X-Gm-Message-State: AFuF++ksmhQ2UOW4Y9bS4fwla+JfT+gEaxBuFf/rJeVM1K2AthW5n60q
	k1Lm4G8/BsHSmBTxc4065Re83YcY7Z2R7y1MRmu7Ojy3zTdh2QwMQd+z
X-Gm-Gg: AYBFou2LBBCKdpiA1ihwAHQvoSP+HKMPLSfvoR5IV29GExAS9WZfFq7JPuFrpHtzEAc
	A4xHTSXfzpf1+ThCvwFOm8Q7v+3Kouf5jj3/pOvTsbAbNPBdf2vlFgcBREY6aASWqZaN6+/i3Ob
	Idg8Yin7qsqNuDPTrBoW3ET3no202BUJCioX/II6YIRNKGJqejynTiMzzYljUNke6CmmMpzpSy0
	Q/9PAxAruToDeCsmtTX13e8ays7zNji9RZvcoSpJhkWx1yXc3QJ+XSkDgncEM7HlAOKICiBMie1
	GAksSJEOFr9auBB2eFKdpm1Hi21QE7NcPw8diFY9feaHTeDCLQIXfr4vKeKPGbKHfYVe0FUe/Sa
	SCRBWAsIjhkOtqzFy/JHJsxBMZGlI4ZKYRgFWFTb8y4q/rFynwHLWibBrYV54g0kAAAkjLp9Xqf
	uRBDmj5RzSCk5gajwKUs2TuU7LzBZ64zPLTOfK7rrjOezlbzdVzSCgysAVRbCkoFXbpFZWz20UM
	tk=
X-Received: by 2002:a05:6a21:7105:b0:3c4:3321:4fe9 with SMTP id adf61e73a8af0-3dd8c3d20d1mr2273049637.7.1789702243765;
        Thu, 17 Sep 2026 20:30:43 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bfbb4db4sm156353a12.8.2026.09.17.20.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:30:43 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] USB: phy: remove unused phy-mv-usb.h header
Date: Thu, 17 Sep 2026 21:30:37 -0600
Message-ID: <20260918033037.22622-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918024758.359928-1-enelsonmoore@gmail.com>
References: <20260918024758.359928-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>


