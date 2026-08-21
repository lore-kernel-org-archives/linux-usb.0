Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137FC3A83A8
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787299823; cv=none; b=ZLSQ3TARGQBm14kesLfxQ3+sZlfjxeVhy2LU76UK/jWP9TPXpJdQY9Po3fFhTE20NE8TCJe9RzhWx0vpFpCwAPrUlnsRK0vrV1VcSgAzNq0iqr/1fPXzkAT6vhc28au1nGpW0ESbdwY4EfY2DlS59QSw9f61OIB3ZnI0Z5evibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787299823; c=relaxed/simple;
	bh=BQN9N4f5jMVvF89zFAWvL6CSWNmtmLKaU0Pfqpq+JmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pDMDznqmhneuH8wWVORaW/Akf1NrNSYfzno9UkQX5ZW39birPNwMtH4ACf2AeJkQF6Pwc3eqNdqjvew4HPBeamH004L6YPMkJTfbrC+9BMhJD3Tih4eNazVbotu2O6xFQLapZPvN/Tm9z/V0P5yCPGE5qhGQltGZgj4TmeugKhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5N1qibC; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5N1qibC"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80cebd41372so11405437b3.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 01:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787299821; x=1787904621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQN9N4f5jMVvF89zFAWvL6CSWNmtmLKaU0Pfqpq+JmY=;
        b=Z5N1qibCASiFojkGGwPRuuz0bWznYymydunAuH2VoRPE79lRMZzUSbvaQQuBOJ6DLR
         JcZX2Gx0kkm+SULpDJIeh82RSnqJTsDm2iQLK7NJqDxZ7KTpzwazm6zC48Q1etiE/xDX
         t8+YZyzAPnXgGd2Q7/30sztugU8y8n0tUD5jLN4i0Ae3GPAbe9KU/ZtnF7KlEddKgzId
         JbR+4WEBL/3qZb06ATdAFwCLQYo3TwvACdTDcOKiuGEh8YOWL4JHXP4rqiXQ1twGXiko
         CeFYKDuvprRpWOnbwGycq4gOOMZrlHD7o0q3HNyNPcPC0U/rw5dnYjjL4k+LXzPJjrIr
         Oong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787299821; x=1787904621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQN9N4f5jMVvF89zFAWvL6CSWNmtmLKaU0Pfqpq+JmY=;
        b=jRRWD0TZ/c4i7W9nNY0V0SLC4pDxVH5LtCTN2TjAfUhsOEGtTP1GMtis1PBPcTnBeP
         fbB5my3A6omjqxqxJHkNzX54T8jsb3A6Vlz3jTaQly8rsdoY1fg882Bf5rI8DTVwgjqn
         /sVifUf0EDsq8HzDi3JIkeLQZvUlbJ/qcoslqAr7gxzPLu9gZ6EgURqXrozdpIjxefFB
         oKtkqjwRUzohnT+VsfCbDDJRfyHDdkPg03sx3wZdHRw4Lo3pe50M5RlGv1DfK21rtnA7
         UluTqqycm40bJD6cE2bmuwmE4Ozd8SitMhDkmqJnMT+QLJYLZjuW2GEHfbw8rObGsLIv
         OeVQ==
X-Gm-Message-State: AFuF++nkvpL+DqWtHIVujcS6HqtEuiHcX1/tFi6oYwDHZ6a+kJQNWLN8
	HVaHWiZzV6WS0b129w+Z4R3RrqDkCmpjnruwBlyDwM8H0z6Rj+7Aj0E=
X-Gm-Gg: AR+sD11Kq8F7yiAD9T35lDsaMm6G1vGtJkdkZpbFrurbRCgQAPrTfZMPeQtav5HEmaA
	07pOmtVx7wprN5ZBWUVU9IzzoczaLP40G3AUc7zDaLgR/H1ag7DjDritv/QKFXFFPpbKcCK5LXC
	oUVYpTwwx0Gz13HsuuOm08W++toapDJq0/+wZL6G496dTybJyt/dbr4q1Xfu8KMON/yldbQumvQ
	PKQIfL+4aWbti5EPl4KOpwa89ELVatYmqBCXhGAweyTJHd+dcj5g3+NQFShBD2KjBP9DnftpVNx
	/DF1ddG5TRh35VJ8SKjFRpphba3e/nxJh9ocGDFGmDr/Fs/5IlNNpsSwH/+EnL1KDLaiE5iAZey
	hDk66tvoYOHhWsQmiub4UuNncHQl1YTprCidm9Ankty+2oKZosxlzS7M6g+Bj4x0mdBQGcyQMO8
	J6EPJIBxrSUZfkjfk/wyxEYVXDqcJbk9sJWRmLjISnhCraIBHIXzr9dUpIsIYGYwOmKETJiRqrv
	o0EAKdm5BmQeY8E6v0=
X-Received: by 2002:a05:690c:e143:20b0:80e:1ad2:afc3 with SMTP id 00721157ae682-849f2e187b8mr14360017b3.15.1787299820976;
        Fri, 21 Aug 2026 01:10:20 -0700 (PDT)
Received: from daffodil.tailc06997.ts.net ([163.152.162.75])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-84512a4ba95sm36206317b3.16.2026.08.21.01.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:10:19 -0700 (PDT)
From: Arka Mondal <arkamondalofficial@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: alauda: stack buffers and unchecked alauda_read_map()
Date: Fri, 21 Aug 2026 17:09:51 +0900
Message-ID: <20260821080951.39905-1-arkamondalofficial@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alan,

alauda passes stack buffers to usb_stor_bulk_transfer_buf(): five
commands and two replies.

You attached a fix for this to bug 217862 in 2023 (attachment 305027),
and pawlick3r confirmed it clears the WARN. I can't find it on the
list, and the buffers are still there in v7.2-rc7. Would you like to
post it, or should I?

I can also fix alauda_ensure_map_for_zone() ignoring alauda_read_map(),
the oops you identified in comment 11.

Neither fix makes the reader work. The endpoint question from comments
13 and 19 is untouched.

Thanks,
Arka
