Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743B2DECA3
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788637246; cv=pass; b=P9alcyZFXdH/i/QoGyVWOhSPLesZM+9AtP2ou4hPFLRs4T2WBE/SNjg1JzjNhjhr5Pbn5Ri1sYUEsPt/3I7X/LSG1HgJ/axJgCfJXqgW04bruIdWle9gGMCfOYu8u4STEjxRaUDT42pn1wmeu1SgRFzU7rJjMG50gY8d2tOmFmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788637246; c=relaxed/simple;
	bh=iXw3chCNliGSbKULYyxbP99o0tg256xa3FLuXiXBnqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neYWBnVDJdjCQQDHjmilyuoc+4gPOXEs3tC2lLH3siIvTKRnrQBg+iP1JMvLxwgvlwsw6WeDPFTR/DnLADTVHmohvTdqCLJSlEPQRuF2YbSpOasmWtEi4pc2ciZ14T+L/wC9ChDzERQeDo6TWxOF92tb/X4TuwstOmAQEdj5DCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWt8i9FT; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWt8i9FT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d8f265cbe6so16338305ad.0
        for <linux-usb@vger.kernel.org>; Sat, 05 Sep 2026 12:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788637244; cv=none;
        d=google.com; s=arc-20260327;
        b=iuv+NA/gz+4+H9weLCuIkYG6pRuq3HXeWVpqI5L0Mrbf9v0PmvIi5BZHeZ7+4punq/
         8ImwyOvk7Hx/WUxJJicxfoSD5HjR1JDtUZA52HyFQ9BjSdklQtmIwDO2FjAckWF9wElL
         q96Yutd7c+SjJjy3J0JXZvOMPrVNswgFQAF+C2L4ohxtmPvEc6dHob6YUbKM1pSnULe9
         fJc7Os05rs2CtvZ+/DJiWRATpNMUxsbOMMHn0/iV6uJxEMcnyYKS7iwZuBGprvCv2iTa
         I6yf7cm7wJgOL5cDDNkM+/koSJjZFbvY42xjR6Rd1xO4qNf9lO4NmRDfrUJB+30f576l
         7Jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXw3chCNliGSbKULYyxbP99o0tg256xa3FLuXiXBnqc=;
        fh=SeEZwMskGqGO7QX4PC8W4YHENtOXjz5ev20Jfgcshrg=;
        b=d/Zlb+s3gU6Q5f7Vmre85GCmXX3hkZ8e6RWdYkVUkL7S/wtGxKROvUr5jNWH9ulN9q
         lsV7OMsKF2nd+K5bAXr10FhZzvqjFJklWcL842hBnBv47ufkaqr1kYoGSUjydncfmWVu
         GY8cjyvqPwGbNodSwZdLIETX3dz6iQHYst+AkncxF7yivDfuQNpplAAcWpnJFWmsIbNd
         gkmu1Newk8AKDEXbm/atEVXvyNX3ibblk7yvoptaNIJZ6uMdIyBSg3+/55gS+qDz3uNf
         msQ21PuewNeXEUPKAslqkmI8UQpxr6uV2WiAJywR8631WJP9EZYT7CODXPU7DLHEXbxx
         KBnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788637244; x=1789242044; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXw3chCNliGSbKULYyxbP99o0tg256xa3FLuXiXBnqc=;
        b=QWt8i9FTj7giBZwUw+q8uv+dMw9i8F9+iewg7JKj0/69682mERIt0BuiRKvgfHUN6/
         KJ7Bfa+ws+ReWld2HPk2hiCbmsuBsHF9OfcuNOQMTKXD/+7MyBENyXP+BmCbJ8UdxANF
         XnJR20UKjFLd3HH9Bmix46qnhsMODKdlPoBWVpl6/uPYW6I08CJ96Vw12baw3GRL7ywu
         mXj42duCCaTyPHLrBSfcked2BC5cDbX4f887PTfqoi023m9b7klr3/kzk0DCGKlvJs5g
         rIO49vgTjkV0bNaiHyll0H8J5G6PxdTUQbiLVLUzOjd99fcj2deMSWIxU0YZhXx6mgzY
         b5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788637244; x=1789242044;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXw3chCNliGSbKULYyxbP99o0tg256xa3FLuXiXBnqc=;
        b=LCxSX4yXG0fAu+zJ5IJz7b39CeA29fhisUAI2n6haekriJ7v1EIDmH8NjtyMa2Efaz
         S8ezqbEtT4Hu3mYs+zUPeEemmDxuI+iUOzEbRA9VjcttqHen/PojXmWYY9sP6YGg5Fkd
         lJ4E/DxgtI5+VHvyR5Bjgf2+kTG/ib5kC2o5zuodXT2zW7gGGpBcgs8eCrC6cnPZMrae
         5gKJLZGQZr1jCdsa550pYppLmrvTuBJPycU+erIkXBSekvEMAgVIE6iaEl9XQdZuFaTx
         ixiAEvsHLe8CAXLp2qvp/SpdrOu8Y0iIwvDxk4lMAG/y8CsCtNwCQgXn5ND8NGbDiPtI
         5m8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwvM2HWYv7enX2rgkuSVj7HkVt/TeEbS0uc5DQ/m7wlro5UzO1L9s3p0VK7D3AieZ2ZwLixfuTlhh4=@vger.kernel.org
X-Gm-Message-State: AFuF++nqJUG4aXDzpVdKmQIT2e2EXVS8kQISytc3H4+/LvD6kLLE56eR
	wjktv2g5k8XyFOQWDvtuf7ZaJ93SuycGJdSmcdRRQ7lBd38Z7ZnA0N5JqPYuuRcmH/t3oKclTXJ
	TnMQSKslekKSZXEVXaI0tz8Qs48yLP2E=
X-Gm-Gg: AYBFou2lgR5hJLUyuGi7ERwvSgn/vHkJRmRfX9nhdWIZQtIpYMiGi8xMys5nS6fp4mS
	UGXcFlJs1ethw42VFz92hO/pBBWFh4VARr0af1qMWuE/ZYjxwqcAq+M7W9Tsp6MeJj6Tss5MXfK
	Nu11x2l4b3iAUHRNYrlO34bhplHkeywVCMhyJ3hFCHFyCp9b4HfF0/alqjcbB5nvbkhdbz/yUgg
	ascjnZMpu/yxSYED771aNXygmD9bNogbe1GUS9FW0odpIQ9vFbPAtPxNZw9VPKz2in359mDABMj
	BCnhdZQvBiJSpK/9pGTqIgf9lOs5oeaackVs9Pi52XSjfA==
X-Received: by 2002:a17:903:1a28:b0:2db:31d5:1448 with SMTP id
 d9443c01a7336-2db31d514ebmr60102735ad.22.1788637243649; Sat, 05 Sep 2026
 12:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904163827.216389-1-adrianox@gmail.com> <0738d3db-3861-4eb5-9847-bde865a1bb28@rowland.harvard.edu>
 <CAMGU2hUOyoWAG-HVCvchqqc4R4uQ7QHaJ_GKGK+hUWw-=Z2deQ@mail.gmail.com>
 <c97a6204-5e6b-4306-a4f9-86b41c268dd1@rowland.harvard.edu>
 <CAMGU2hVGz9PwXhi+j3z0Zn0keUPt6Y9ArU38tpSRYw5ZHupDZQ@mail.gmail.com> <52df9295-9989-4a17-86ce-b3827f72ed30@rowland.harvard.edu>
In-Reply-To: <52df9295-9989-4a17-86ce-b3827f72ed30@rowland.harvard.edu>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Sat, 5 Sep 2026 15:40:32 -0400
X-Gm-Features: AcwNN1XFO-babDActdz8KZm61Hkz4JTnBnWD-PEh21nPf7y0vdtIiiFEhOuyAHY
Message-ID: <CAMGU2hW2cSZuzm97h6f3DcZAzH=1EY0WVBKC+ObsamMJEkAvWw@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: gadget: inode: fix use-after-free of struct ep_data
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

I think the main CHIP has a dev_data instead of ep_data
 and it belongs to the mount.
