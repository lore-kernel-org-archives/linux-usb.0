Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D76D1096F
	for <linux-usb@vger.kernel.org>; Mon, 22 Jun 2026 05:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105584; cv=none; b=MxuXlryIUdPRQcBZzUyuN6ZNY/WnYiyytZVUd37DYKAcTuNrPyGP0nKPEJvCFDW8V1pwvK/MsU6jj5ATVa9WtGsZacMUaQ8uqqCL8ebb3QX/j1McSuQk+WUQETk7qgk7pIkQL0fDjFM3RNxLc0eUar9JCvEUzH8nNtevUNxqhmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105584; c=relaxed/simple;
	bh=C/HL6GgTuQ1x/2FnOwctbqk3Gzl+9Azc71OikTb1rPM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oH35kODnZhAGBvygMiz5tl1r+rVecPf9CPqse0MjfkcSDH232KTq7Ae8mXxQlVCIcWsqoDlXEdg4xFqMWT3yF7Fzu3W4bgx0UpUvvUO3Pb7tm8TajUItzBPH74YTHArGAv6CsFkmYRBXfMcvix8DtpV04uAoSD4dPxWpk7R1STw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwUqvbSd; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwUqvbSd"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30c23abc62eso1562967eec.1
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 22:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782105582; x=1782710382; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZeOMuSexwyWmR1jQzZ0pfBD0YRbwHTAcdxldOuFVq8=;
        b=AwUqvbSdFt7I+nH9iLXj9N51gzuiRed/+7vMzeIXjAqaBaBTa4MjHqzak4FXSQX9mG
         iKrjQgY0tPPBYR+tmXoA8DTqVkGQy6GWodyNo+8PvzNWqm9XsUZ/FJODhM3s20WWeLtA
         2EJ+/N5nEdzGvgcO1VsAGC1tyISajthGjEYr374fdINR0SKKDScdSuXWFHeaF0Q0VAS3
         6nfYAWKRnCPPn5CvK0/EynZdZaWenZUvFdYxN3pnL5rXGLfVIZ8W3nv3dSUqm8zsTOZw
         0kczfGt7PMaNPiM5YQFQioh87AETUQtRMqVi3MZQJkXAgIlBdXTNRhq9KqxhB/oZ+Iip
         f7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105582; x=1782710382;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZeOMuSexwyWmR1jQzZ0pfBD0YRbwHTAcdxldOuFVq8=;
        b=qsAIxK/JuCzfmHNt4m2TKxcsLHOgl5GbibdLoaTcb2hIyZ936JrEMiyK+WCsNbPnhh
         GifmktG/4C81+blF6E1cgtmVFVhKc62f9TdR6+Jbp/03cmKhFe3vioxcDWCRzwZcyLId
         2EWjWChzpZDF6znEgJgS7dVnhWQVYEC4ijvtUmaTWm+i4DKH8qvGKeV+bPPTkc4lkYqC
         NxjNSb71FmOn5k+Fzu5ufYQW+u/peJehfp3yjnsfKrE1bc7hwcPAlXE3UIp77cYV3ev5
         OLtdcQPqTQ055cqqFNZ86aq5M0krVor5eLGWjjb3NZxO1VjSiFsCoz/DRaWOLtT6aOLr
         L0Yg==
X-Gm-Message-State: AOJu0YzP33nGcNOP+8xQw8CRPKLX4vb4hSCgc8ccOK73WCKXECyHIXnR
	b++xYmbQ4fvEEdb38wlTYKLYo6g98sOE7Jq8egmZyyBbfEMcO/W9i5Vc3sOCYA==
X-Gm-Gg: AfdE7ckGCMFNDMv+HIqcRKMIEu2eOIXUMImpeKDIG3cEoJztx6Ug2Tu6nwJ4WgGqAfS
	6M566g7hDucOz92kzytvtcnTFhRPoRTsA06+TZVjZxm8UJCxU8/HzHywCbLW1EVpvJkD5g90g3k
	AVK5ujtcRkpev4k0ihuBtiFyhW6FrRv/poxB2LXJm7c9jAZUEgzTPf2RYhwTyrnLVnFvA1gqibB
	umQisD9Ro1xNb/Rg7+s1ZbjIqVIRz0bAZH/jvwuzUTLD0hXN07fuJv19fQU9H014ozraNeo1CFl
	rnJ//QbZ4vM7VqucbVAfwMzusujoAS/LaJngneSHtz8jB2oQ9Sn/lItIvzBXTr/80QQN0+HrE1k
	0sYtCF0mr+GZ6G5fqEPQY4qQP00EqrIK98Hjn5ZNZ85ygXtDoHa8nbAwExw8R5YZSVBteyUngmx
	59kmsMdolQQPIwopbGxkvLhCi/lsGb3wzkqQ3Mhu8i
X-Received: by 2002:a05:7301:10c6:b0:307:e4fa:894b with SMTP id 5a478bee46e88-30c06ff40bemr8738044eec.8.1782105582105;
        Sun, 21 Jun 2026 22:19:42 -0700 (PDT)
Received: from smtpclient.apple ([2607:fb90:8e0a:2041:e8ce:c3f6:cac8:c8ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba635d8sm9891389eec.10.2026.06.21.22.19.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jun 2026 22:19:41 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] USB: EHCI: inflate max_tt_usecs and implement sitd
 backpointers
From: Brent Page <brentfpage@gmail.com>
In-Reply-To: <a30d95f3-9802-4a2a-8b5e-ff4b5ac93662@rowland.harvard.edu>
Date: Sun, 21 Jun 2026 22:19:27 -0700
Cc: linux-usb@vger.kernel.org,
 Michal Pecio <michal.pecio@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A1D9DBA5-AA58-4263-AA26-FC8C59F011CC@gmail.com>
References: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
 <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
 <EC0D612B-B61B-4652-9CAB-FCED814F46AC@gmail.com>
 <a30d95f3-9802-4a2a-8b5e-ff4b5ac93662@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3826.700.81.1.4)

> I'm not sure what point in the code you're talking about. =20
I've been talking about line 2086
		list_add(&sitd->sitd_list, &iso_sched->td_list);
and lines 2177-2179
		sitd =3D list_entry(sched->td_list.next,
				struct ehci_sitd, sitd_list);
		list_move_tail(&sitd->sitd_list, &stream->td_list);
in the v7.1 kernel.

> Also, you don't seem to have noticed that iso_sched is different from
> stream.
Yes, I did mix these up.  The new patch (v3 soon) is better (no bug when =
crossing
urb boundaries).

From,
Brent Page


