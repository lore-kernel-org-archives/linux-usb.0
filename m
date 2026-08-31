Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6656B3BED2D
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171932; cv=none; b=UUc/F6mKuuI4tSL6DAmv/ykQdNyEbMpYIenmycZukr/PP0ans+rm4Wsdphzk/tkCoAu6FfNuncaNC+rV5beXklUugMuf/r4eePIBP+DGeMOCbGNeMbVWATR4RspNEICg7cxpe7Bp+UOWFX1ui2uynxwi6XWrPmkZB+MndP1p/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171932; c=relaxed/simple;
	bh=oDdxchw+HfFAGtOiAlLwJIKnl3Z6Y/3M5kytY39eayg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGdCZpKAZAE9/l3P5jbqJKIVdvl28BdY0Vl/ASF9fyd4RyN4zFEEY9yYZWnGt+Cy1d5eMMNJUqClW4tvkVUaffnaMtXOySO9JBaUuM3OibMDbmKgsiBtpMcQ0QvDvRjw4Phay8pd+cid/f0iokkxB8YsC8qwcvWR5XB0OVIA+eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQmFP7wP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQmFP7wP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so3468047a12.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171931; x=1788776731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85h0gP4EJzGrJjTm/s6tdHc7gvUEeMEkIXjoNPcxSzc=;
        b=lQmFP7wPAnoy0qe3XSbB/eiBM2esLl5N/USsJjhsB1gbnUEPyt7VReggrpXbcUGSgk
         +mN+Sd9W/FzSyDu25w4DBb8hfKTyotLW8hOeIFxtloSaXyOljqfiiuFyxUzGtRpp8gDZ
         faML/yQDfY6Cqp0jjl1x92v+F99BqzdJ5CNCr/u4Pe0GjMr3EsVmKLvsOwuG/9UqGgeS
         MaHjoJKp69sSXClxpYS9EDQECXMD9945GgpYpTAAcFlmTyEXO7zXl82lKY7fbcG3yzCo
         w3+S0sX4XPwDzEpEHQ+lrlsjZWn0XJVq/qXZZkq7O/tL07XQKsBrjhNWiU+tElG4xlUt
         3imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171931; x=1788776731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=85h0gP4EJzGrJjTm/s6tdHc7gvUEeMEkIXjoNPcxSzc=;
        b=Lx2MQl3M78qmW7P34QTZn+G5h2Lc4P+3wP2U3ltCs10/CdknjYGw0FICKwg5LLRvOJ
         6vIQLwZKpEUV7SUXuRWwz8R362GQrLiAteQYnjpskl0Vu0pol3vpvXhRUxrTeUlmCYp8
         tix+qbQklCaW2/pPUxwmr8vzw0OtcZyKH9m+ch7Yg8T1h1nXTqnHBoaY0MheGHlbwHGY
         hCzs8j8MJH2XTZrWFsWdCNXvGch4kp0xUGGIkv8f1u2FnqAELZZ5tymLegINXKwRVzGh
         UluPkzGHBZU4KTE9AR1syhlbMAWF7UK6JvvznjsGThNUepjavZcUjkQgoya75i2HTQEF
         kHNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrwp6LSwThbjpB4gHj+w3HyxeGjH1I52IwneFq/OFsyUo3roYfVILdW2D9IHSZ0Yc5UbzCVssqZLl0=@vger.kernel.org
X-Gm-Message-State: AFuF++l6z+sdNCwzxSNj8KZ+qzXDEYjNHIN9+WlDkSGlfpw0IM6GRwgi
	j9cyyU1rDS9ejwwm+KqPJ3/GMSN2WVD/uJLOR2z6gdLmMadUHXeqED2BTbc+pQ==
X-Gm-Gg: AR+sD11Ti8A2FCcbqicfyf33IjjmFIYvpWPukQKDzx9shNF9Z9hGzxJzhL2CYSEBK9p
	f8wT0wUa3NdBLm3FvG5AmsNy2Xs2sbXLmPa1zFmd8Yl8clfOmP3aKHfaczp5tjBgDSMVV3SAnUi
	q8hqtI0UNndRW2omPioNR7wNbG1WR1Cd+hD0nZslRS1sxObQnGLKxTQKdxeu1EK6UKZNM4r6OqF
	+zRj/1VLZdggoPPQfQc61lId5u93XUC0oa2VcTcIQ47WzAJvnYpl+OlNeGJJYElVlhji/kowtz7
	+cqAAFzGv/qX4MQ8Gtl52EwS+PPjFCpWS7JkIXA7lriR34rRZhsF3jL7HhfCt9I9eGwfmi3RqmH
	EnADsFRN5GnYYxJJwikC1NmWKCA176ogKZ+f0mqxNIZyEExWQW7/sADisgzG/Nj4Q5sxFybp6Gn
	kQfKsS/ABGx+6hYtNDX0MQKpaAAcscbjAzZjQ8gu4c8ckGVfvbibsj0pfGZX0nrgqjtQ==
X-Received: by 2002:a05:6a21:6e88:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3d267b60e7emr43957424637.9.1788171930549;
        Mon, 31 Aug 2026 03:25:30 -0700 (PDT)
Received: from Default ([2409:40f4:1016:5ca4:c595:44a4:9cb1:2f2f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9595bbsm32800439eec.14.2026.08.31.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:25:29 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH v3 1/2] usbip: usbip_host: fix null pointer dereference in rebind_store
Date: Mon, 31 Aug 2026 15:55:17 +0530
Message-ID: <20260831102517.109498-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026083141-morbidly-swiftness-9f8f@gregkh>
References: <2026083141-morbidly-swiftness-9f8f@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 12:04:45 +0200, Greg KH wrote:
>No one will ever notice this, just remove the sysfs file entirely if
>you really think it is ok to remove the functionality.  That way
>userspace will notice and handle it properly (hopefully...)

userspace tool atp handles this properly as it unbinds and rebinds sequentially.
The problem is when any script tries to do this without a particular order in
sysfs: bind, rebind then unbind causes an invalid opcode and attempting to directly
rebind immediately after writing to match_busid causes the dereference. I think
it is best we drop the rebind_store function and use drivers_probe(). We add 
del_match_busid() alone to rebind_store() to stop tracking.

>But, are you sure it is ok to remove this user/kernel api?  What about
>workflows that are using it?

Any scripts/user that don't use the sysfs properly can keep the broken pieces
themselves, no? We have the newer drivers_probe() that can perform this
much more cleaner.

Ultimately we can keep the rebind_store() function if you choose. But this is just
my opinion.

Thanks,
Jeffin.
