Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29F4756BB
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939876; cv=none; b=jen62zIML0zlsFH4DG1g7BJc/Lgo3SeeUQ6GR6H3Rb92y+W76wdTOGCcsibGXFEbZyyJU79Gw0WcZ19X9VnkbWANSEuyG7lPTj7mtnoQPE99qqqWGaBiU9gcRde9Dx2xwr5nYr6JIj2V1fcY4OfSqtx8PLGUk5xnmT1t+JRzNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939876; c=relaxed/simple;
	bh=k5llA7pmOSBPbMKZGSq3pCo9LcSxO2kYJ33h106sOfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ic6p3ufkqfFXA09C+tifWyl2mWywEXoyipI1MAK0vILt0Rh9hN+UjhOIdFPwIzSNkiSf7W3TJYVSb6+V+Zj3L9482OlPIMmP6+KYGa3F40c5bVzU0x/qJOYqYXFvvXag5pbAywUIBd02j/BViCOWk9knoFAG/bdtJcnv+B96ZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdBdrafv; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdBdrafv"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb767d286so23187661cf.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789939867; x=1790544667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5llA7pmOSBPbMKZGSq3pCo9LcSxO2kYJ33h106sOfM=;
        b=FdBdrafv+bDVQr7goSmvCgU+Zzd9S3beNabGhFwz4zD8eAjVnAwUnFvXbnXApA4kr7
         o9eSm35poFkxOEXLWCDBLsq4Gc3+ZHppWgYJLvI9XvD22qp3OpRLP5xxn1CupNX8ETD4
         +X1Ix5MSKg5Dj2RU8XsHiH/jBQiqdAb2N1YLEnE8aBBps5SrwYppgIOYhW9XUXe422Vd
         pixaySUcK2wu+asD80loUbRZAR8yXkHFlTaox3EAYSWCP3x8hC7IDnHQGAlRiyy/MBf7
         Nud6H5Jcmj8wd/VJat3j9fyffSfmbyuiGlaQk6X0qLGm5xz3s8IdH+90ZoozzJC+eE+z
         gAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939867; x=1790544667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5llA7pmOSBPbMKZGSq3pCo9LcSxO2kYJ33h106sOfM=;
        b=NQmc+OA4nihc265MwCrqC+QA8D9cUUVN6i5N3ZdFn+KSmkqiGXspTpsy93F+UfbXe2
         dtwvT20fsa4BIrsMVHEEmpgz3CoXTBLZuc/cIuvjzJ+TBfKxibQd1bdnH2KEXzqo2pCd
         gTqUS6o7saLz0FvYlrHY7xAv2GuITwGnettYcMuOnSHMX8Zs/f06xkZnKLjWwoA4F2ZK
         2BHPl8tWJZYQYuP8luehcpf+dIt1NMTl2Jeu0zMNxJ66UnYi6LiFhqSK/C35HwMAcRXU
         90PtyrxcSHJ6MZ5Udo3PuFy9laDivae+eoNmfx9BhMwZslx1jNSMsYcZjf7WVKi3Vgah
         HdFA==
X-Forwarded-Encrypted: i=1; AKwUvBzwZA6phHbYJpO5hW2ozH2hFm5xw6esxX+C6ixh1BHDA6Qm+eDbND9ZLBIhxi8h7EAigoREaZLGSqU=@vger.kernel.org
X-Gm-Message-State: AFuF++nl2Nh7LOEqwyHZj3+LDZvhOXOc45Hj1jt9vmawK36ziAAzP7Fa
	HzilYh6ulZ5ByHtWC915t4Dq859ANz2JjFmEflMCFJ97PsdM3uSGVJPI
X-Gm-Gg: AYBFou33FrI8wsAD3S+ZpXfF1vBtU7QOs5OdGgW+O1vBWH2cQEjk9KUnyRVKYAsp8Wf
	kKbYqfkUb+s4caGCTz1A0k222VePj6T8yK/ehSWzx7NreT+4LPqbdB8tIDaBmo3cnlm4FkTiU/Z
	9A9f1hBITbRhONIGdCXIDT9hASS+WEbXK4FM7tyZ7Ck0Yqjvc/tVVW0go9Ow8hQBDYhowDcR4WN
	NN0sCWbA7s3QtZJYXA394Y418bS7fyVrGMXEgt47CtV5V5ZpDv2SwW/a/KcMgeaYA/SlaPM95Ar
	dgAODUgwYdrFrfPywJ6TFIsSY4mVotKJuQIhPazTRg1JK47s3f3MDxxSfrQN4TLfCMg0WndGA4+
	3gaHG42cmV6ylqYlps2l8jjdb4+NL6/SsrKDWoKt1IhCkOXSUGR6rq43vA9OynHoGs5Av6h9F4D
	MA1XPlcDQuSsS7DQ9RwQoB5KGd1MQ6RFNPMgisf+CYX5kFb5ZUvSxhlsTfIMQfkXPlzn0OFZhpG
	sWYqbg9canJAuCY5gy6W49PxvYx7qugz33WBrINpnzIlzhJ
X-Received: by 2002:a05:622a:110f:b0:52f:ae70:5e1e with SMTP id d75a77b69052e-532b71da678mr75696031cf.22.1789939866681;
        Sun, 20 Sep 2026 14:31:06 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae7737f3sm48503221cf.28.2026.09.20.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:31:06 -0700 (PDT)
From: Seungjin Bae <eeodqql09@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Li Jun <jun.li@nxp.com>,
	Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: usb: typec: tcpm: type-mismatched PDO handling in tcpm_pd_build_request()
Date: Sun, 20 Sep 2026 17:29:35 -0400
Message-ID: <20260920212934.392398-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I found that tcpm_pd_select_pdo() can match a source and sink PDO of
different types. Before sending a fix, I would like to ask whether
this type-mixed match is intended, and if not, whether you would
prefer a same-type check in tcpm_pd_select_pdo() or explicit type
handling in tcpm_pd_build_request().

The tcpm_pd_select_pdo() function matches a source PDO against a sink
PDO using their voltage ranges only, without checking that the two
PDOs are of the same type. A source PDO and a sink PDO of different
types (e.g. a Battery source PDO and a Fixed sink PDO) can therefore
be matched as long as their voltage ranges overlap.

tcpm_pd_build_request() then combines the matched pair with
min_power()/min_current(), which apply the same accessor to both
operands. pdo_max_current() and pdo_max_power() decode the same bits
(9:0) of the PDO but scale them differently (x10 mA vs x250 mW), so
when the matched types differ, the sink operand is decoded with the
wrong accessor. This misreads the sink's capability and weakens the
min() bound intended to cap the request to the sink's limit.

This type-mixed match became possible after commit 53fe0de9a35d
("usb: typec: tcpm: pdo matching optimization") relaxed the match to
voltage range only; the min_power()/min_current() macros still assume
a matched pair shares the same type.

I have not observed this on real hardware; I found it by static
analysis.

Thanks,
Seungjin Bae
