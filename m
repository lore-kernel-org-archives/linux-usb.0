Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B508031283E
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 12:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857985; cv=none; b=b5MyrlEbe6W6I8Wlge3bTQ7rsrOwkfN8KJuIQLPK1mM4FjCb2m7NHtir3QlwLzRNTfJ3FCpDfXun555YPG9PVK9o4Le1H7GaGpc8a8F36JOjyuNJmhdeJ8csSMo0FGSZ1mKqv5IaNPFiSKHmt5ixaW0kENKkIdhd5OfWS3zVIQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857985; c=relaxed/simple;
	bh=nD97E2FLkTmB8Hqzjh5qbJLABCn3WWh8QM4hR/9p5L8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n6g9RAJxBnD62AA+TDGs3pYKhBzVwodEd0ngCHsaYhqB+tDoREIDVbsIhJt5J4P0ERJC00FF2cWhP2aZQMMVUcc4HqZxx1U1/CupKid2NTTtnyGBxCcIvD0keY+spGaUiTU5M/wOfptyOFEUFkPRaWAzlr9Ln8XiVzvXqA5GGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m20HE06W; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m20HE06W"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so50614365ad.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 05:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857983; x=1791462783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhoYyUgYu/PYHT4QIXHxuw0wrILGAnXiNG8GA+32skM=;
        b=m20HE06W/rHAhGGOPufmDORKEw5cJ+0nKWEEVDwtTAzz6QTW837a3KbuMLP7jN0HCz
         9c5Mrq0Jf19thROmWriYyKs2Qa1JQrgvI+oPzixdzzOdzOjeKPw2ajYdxDQ7yXHBChVo
         4j9QukQdPF+d/WXW7PX4HOiLsXr4iZTYsAMA0qVJftExKi76MsJcDGBvRr1nZv/+29L/
         pq30TTpldASWKavhpovcQnJu1Mvp784xjiru+HfZIv/nbyOKblbBXrA4tiJ6Z28OyLvd
         aVQScSBoVT9Yx7A5yImgsUuKK9LcrGjiVjMH/N0qZqOycZmFi+mtKskIlQ6VOmVnJdws
         wN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857983; x=1791462783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhoYyUgYu/PYHT4QIXHxuw0wrILGAnXiNG8GA+32skM=;
        b=lWEtTEPNF0GKYsouCjCnw8tKnYuGL2Cb3z/ROAPhmEzucdDbadMR/qIc/1hD0q9vN9
         WlS34CkKcXhvNm0kifMn8V5cUN3gx+W48HlyYsHqFbUk4SfNlrYZan66d1Eg8uMOMbum
         yIzf5qTNzCY5WJtejbbz+rz969hB4rF6POrTazORP8cEHDbgS+w7QBp6VBuXVNBQ6/xe
         XRqjiU1buUkHZj1AY8akhxgMtG8FSl/d+0Vp0fDA7r+D3EfgvjdzpJhL+Mkw9yMaaBKt
         SVd9TP/dTuFZt6YzyVjXwuWU3TrxdxTPkiq06E7YOOHsK385euazI0vv9eTbHce9C3Ns
         kD7w==
X-Forwarded-Encrypted: i=1; AKwUvBzXOuqDy+G7wXaHowy/+3+04kSyaFqMTSzhkTlg6dKms1dTKt6T+deZZNtKP9PbC0T454bYn4GWth0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0WeJrNYJ9otiezbhmXkuhZsZwfBmz7In8DNISRwbn0MvdWaAV
	ETzC1C+lPiSqY1H7stfW34gIvBk6mhiGzJktc4Rm4mlf7+9ZmElgd03B
X-Gm-Gg: AYBFou034GGsuIE+6V8mZHxcPFwjpSeKuuV5XeFbAjuGelQS0n0ibwQH2NxTHDlZVmH
	IO53ORWn7pnOLrbCTFsya6beAG3d+S7utLOEMLwhmr0V6uC7DQ+/Zix29eLyR9oiTH4w3lOi9J/
	Zy/YOXgDRheK6rF0x6sJLIXbJgkqnNIuvK7BZBLc8swK2HVxsr0c8qy8wkCsMWN2P4ftpK/yL5/
	m3JX6+MPph3p18Y9I6FB/r3qXbxNRjWkofcGYN5M3zjnajnRn1ns3SqHs6xRrjfOvu5w9PFbirU
	GZGn0aTuThRf1VksLbHAb+ZD0OT0lWPsxG0KZgeqNxsdRelM99tz69wH/t09gnxWfXOteSqz70u
	gj1efyOpHM0dywzegko9YePZam93Gk/C2ek/vryqpIFGsLnDQSN9ibbuAUN0rSZDNzQGJPL72Zx
	0ZrcidKVqyBCgmjAumf6eSwJZs602CykwBF/mQeRmzTqBpM+tPqUrJGKztJ2Zl21N68E5qGXtR+
	2oylbf7ylxVNaDxfonkqVYOYxAh
X-Received: by 2002:a17:90b:1d0d:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3a4d1947ef3mr3836560a91.67.1790857983071;
        Thu, 01 Oct 2026 05:33:03 -0700 (PDT)
Received: from localhost.localdomain ([2408:8352:470:235:7e7d:21ff:fedc:f409])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm4464178a91.13.2026.10.01.05.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:33:02 -0700 (PDT)
From: xy521521@gmail.com
To: stern@rowland.harvard.edu
Cc: xy521521 <xy521521@gmail.com>,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] usb-storage: ene_ub6250: don't let the card-type probe hang forever
Date: Thu,  1 Oct 2026 20:31:33 +0800
Message-Id: <20261001123135.38831-1-xy521521@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: xy521521 <xy521521@gmail.com>

v2 folded coding-style cleanups into the bug fix, which mixes up too
many different things [1].  So split it into a series instead:

  1/2 -- the pure bug fix, diff unchanged since v1
  2/2 -- the coding-style follow-up extracted from v2

v2: https://lore.kernel.org/r/20261001091523.16934-1-xy521521@gmail.com/
v1: https://lore.kernel.org/r/20260929144640.2028-1-xy521521@gmail.com/
[1] https://lore.kernel.org/r/2026100128-crystal-islamic-b783@gregkh/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9

Hongyu Xie (2):
  usb-storage: ene_ub6250: don't let the card-type probe hang forever
  usb-storage: ene_ub6250: fix coding style issues in the timeout code

 drivers/usb/storage/ene_ub6250.c | 59 ++++++++++++++++++++++++--------
 drivers/usb/storage/transport.c  | 32 +++++++++++++----
 drivers/usb/storage/transport.h  |  5 +++
 3 files changed, 74 insertions(+), 22 deletions(-)

-- 
2.32.0

