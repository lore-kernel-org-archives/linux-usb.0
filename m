Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C8E445ADA
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 19:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790971177; cv=none; b=TVriE/HMyhDdJ185rVoAWQGeWtp6lwfIaTGXE1B9Nr6KuW3GXM+EHqngP0spKChUNYmA5xLBhp0QeekQr4gweaVOZKTANFI5JLpygpnfShyVOTbskG9zgXuXZwIGJP8AK3fuoB9znX3K4fP8CIfBnJq0B7K56ePIGs8Ijt7MjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790971177; c=relaxed/simple;
	bh=iFri/vNIS8KeWN/eU20/ScjrVJhCF62ph+HTFCQdY9k=;
	h=From:Subject:Date:To:Cc:Message-ID:MIME-Version:Content-Type; b=HdUKXxJvQBFdyS1lsUTgD2w7TTkOleWOw+fMLo6sgu6Tsomh6Jyl4X78cucHiSX3gXZ4kflq3klqF/jUVvu5C9/lnOgYO7s3EN9QdLzUuiLquzRu1h33AyIoty7o8jgn/tcBPEE0KkRsXHTWBsHspcHn9EkFWhpHoLWjJeaGQfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfTLCulD; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfTLCulD"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso237391a91.2
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2026 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790971175; x=1791575975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:date:subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WKbEv3EoH/ne6QtLylhDgUzhwOIRTlWoTqML9fP8eU=;
        b=HfTLCulDMfJvwLq4llkiAji8HO+00lcx2s7YC5LMWnrW4ee1KCUV3glYnThxAujSxb
         VdwPYBRS6xIK6r8gTNQxkMC2jZfEJlSJm6E/FOLVWGcbnl37i+s/Trm4wkbGKIHQJMd0
         R39kf40XXstxIsKzwGhov5PE167EAb3hZercMn2od1H15YwZyj+vW3AGZmxTLml239Cc
         tjoiA/SidizBuqHYZjEvYWEx8XdCktAgbZLkQfJUbP0j/VUpN+1ilYvn3SlObDMEBDA5
         sH1/0m2quRwjB3KNmZi3azlxtQD1RXsGmjku0dkvbqmDQtXl5xPzZQb2+9djWIl69IRb
         dcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790971175; x=1791575975;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+WKbEv3EoH/ne6QtLylhDgUzhwOIRTlWoTqML9fP8eU=;
        b=yUW+GCjEavUg/0qeA6Em811X6OXUaGblDMl6aWhU6m2yAX6ukIS4aCkHRhgTNEYDh3
         +pgtbNu2yMqucKIlm2cMQM51gG/EIDL0ZrqiatL7bHquf4z+PzIaVGfefNvPTzKBRWjU
         0LMn3Tu9vkmorspmRotyrVotU6XI5ZV5oMbKlq4WZWChwwG4d2+CTTSuysYEBQs6FH9t
         KCpMUQJjwwcwjkfxVzMpQesHfCU+aMGklzfba6EkiD7vtCzEeDI5Eg5gkzqxvfCiy/z9
         QyQjZb3IQtf0ygD5zwrNG+nNJK8uVobU/zg3vAJJQTdAbNu6H0P7XlfAZlVyo5Ubxn1C
         8Hdg==
X-Forwarded-Encrypted: i=1; AKwUvBw9YgWhjf90l5qagjC4j0tFI2EqXhAjsThi6KTt10OuCVTpKW98hOkmY01SnWb7U+eNtOGsTV3tKMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYItg0s1Rn/Xg5LMag8OQXnabcZeDBVI8G0hCXom4Tw+DtrZyTK1
	Rj2FmcU+WpN7tFh309ZSF8m8ON7891bIa/gqyjSMA+TlomK1AhjVSI/5
X-Gm-Gg: AYBFou0DX8PnwXeZ60RWPExTPqLR3oJ9aqYvzHWpw0jINNcRfmwJ1ErLkBoC+mm4ixh
	xSF7z0dJCKJ/qPiqqkYfm580eQRdPSgSW8vU2otWjN+EQ3fuwcj7l6UEtET//cjfWBSzkd5Mbrj
	+ZvlMB08LptVyJzZ0JsWbVYEi6yPBnwUaqrdUPhSEmWYUDYUf8Gq66moLKgSLpKPoV+J4k12dwa
	oqFOmn1qgDxwccA4DOLRS2bOFffeVkug3NNgpiioJXcsLG1hEoA+A9+UsAHR2BVDCov2ZMKCj92
	zgJxc9ProNLQW/sPjHUwmN8Pm13uju+EwRTAoqewxU/ohGCJb0wUvYzi3J3prBedFSeg3GwHFiM
	H7/huviMNsXJhxOFwg07lgtj13kihGsyeSBw9EVdyEPyuoSfi6RiVpeCRJRfQWLOmdCpvhqBv0j
	c2TLYgsmffQxNZB2y9WnVud7jBLh2M1FmEyjo23cxOlySTlWTHvdsmE/eUUK9ZRxqwTGyaN5ww/
	wsgZ9vo6fgfnegSFbXp9Z7cjOPqqbJJKA==
X-Received: by 2002:a17:90a:1009:b0:3a6:d851:21e5 with SMTP id 98e67ed59e1d1-3a6d851226emr2180894a91.4.1790971175199;
        Fri, 02 Oct 2026 12:59:35 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6c8421fe4sm5419796a91.12.2026.10.02.12.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:59:34 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
Subject: [PATCH] xhci: dbc: lock the minor IDR on registration failure
Date: Fri, 02 Oct 2026 19:47:40 +0000
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Changyul Lee <lcy8047@gmail.com>
Message-ID: <20261003.final086.034e184ae398239b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dbc_tty_minors is protected by dbc_tty_minors_lock when entries are
allocated and during normal device removal. The registration error path
removes an entry without taking that lock. Different DbC instances have
separate event work items, so this removal can race with an IDR update
for another instance.

Take the same mutex around the error-path removal.

Fixes: e1ec140f273e ("xhci: dbgtty: use IDR to support several dbc instances.")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Compile-tested the affected object with x86_64 allmodconfig
and W=1 (GCC 13.3.0). Base: mainline 3b7cab693ba2bab63774bf5b988e8a61b2ef0f32.
No hardware testing or runtime failure reproduction was performed.

 drivers/usb/host/xhci-dbgtty.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 3d51e8d82659..2249cc16800c 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -535,7 +535,9 @@ static int xhci_dbc_tty_register_device(struct xhci_dbc *dbc)
 err_free_fifo:
 	kfifo_free(&port->port.xmit_fifo);
 err_exit_port:
+	mutex_lock(&dbc_tty_minors_lock);
 	idr_remove(&dbc_tty_minors, port->minor);
+	mutex_unlock(&dbc_tty_minors_lock);
 err_idr:
 	xhci_dbc_tty_exit_port(port);
 
