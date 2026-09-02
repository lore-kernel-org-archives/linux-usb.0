Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7841DC198
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 01:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788311769; cv=pass; b=U3GnEYD0P0UA3w40Pfrm/wbTuQxxRc+SU0GzJZNF9EqtdB/N+KSg4kmDRM0WFTozFV42hoNUYjm1cQxR7cg8QJokSHo38U7ucwe4Ubp9mjsGhhy7IFbJNxwNcUOA1LNn5yAwXmn45ug5gZ/BT49ZeNkhwX/xz86PHg8Syd6acoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788311769; c=relaxed/simple;
	bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GT+hDAsSGd6DeyZ50GX1ys2tmqNeQMU9TFG87Mp/gmwhMfCXhzWO61xT7emkbj2qctRo0dOGpdAMMgblbA/dHotVs6ZgRpC0Z50NdmuiBIdHaDZgKaUuXINRT9Y/yKpcMq6Ic9JSht4lk9McGWDCBcwZXRdlyROn3Jlht91zL7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rnrGZOZl; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rnrGZOZl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so492875f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 18:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788311766; cv=none;
        d=google.com; s=arc-20260327;
        b=kvZLRdifG6qgQpTXqWCGBI1dqJRZ+E2wywom9DJd4s2DNRdrNe5z2gRZzGg4u/F0IZ
         5cUXk8yhsbHOxp8rFNpFV7T/YW/3w3hxGzM7isSVGCXGZxSeneCIiBS7QNBlIQ8ZidhH
         ErwKiMy/Y4QeLuDrZVu/xpqD9YI4ZbQnp9yrPH4/rsSLa4Hov+tL9268IWBhKsLS6stU
         PENcShY6dqU3QUFOvzqIrbu+LhQmsK5L8HxnK29QI206Y1+HxGUL77Vha2fxRyJRcGWW
         DeLtWS6d8nbjbg9AcWJmMGz9JQ5WToYz8KTRcKOtroYNwOCRPzvGPv/pBl23kMcIsc7c
         YGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
        fh=m1sHKi3fBwjM+BnLuKFpU8mLuOqzTaH48QY+O74UuWg=;
        b=Byb9Hmu1vtT5XSj8ADXkzoY2fdKDys+s2WKw8AVXB5KJejFiMbGH4iSbHrY6bCusMK
         eak0kZ959tUtL8FlVh8yqEbS2QnnS9AG4BQRxGyQ/DYcz1r/lKO58/8eCFWyo456fEJ2
         kxAtTFlBczzcmJxw+qPpOZgQc4WX1FNMnRQlWSQZZzf8+0/Q5p0lGTPXp7PZxz/45ecQ
         mqle8fEGW22eNSlLZ2hczTe6qhVEfXl3GTysuKg06UM7qA9RY4WwhtwuZ2+lYTBiLnxn
         siFbDvxcQeAFQDxCWQQJDOPh1kVsBSpukeWCfHkIU4vqqOxKPWQQKLpsrwZBpNuQJeuz
         AKlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788311766; x=1788916566; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
        b=rnrGZOZlMAX3UmCRrMXFDe7L0FvALvb3cv5AHDo0U0oMjHA4kifRq5ZLHdy5p6SU20
         Pzw/cLBU/twEHZaMAdGA0ML1UoOzzF+BRs6uWTsYGpgmIhToWmbSqfzafzAxBwO3wYoM
         foNp2CHlznQQP7sogjtPIxOWcx6gyDZU2KECgwEZ1ic5AqSDBP6SNhjSzCYtAb8XZbzL
         FQ/UCewamFvUm1YOUs4vVdPGd3eu/o5KGKv5Gz53jL40VALtNA72ssVD/aJj2tQBNf+y
         prHs28toqnagGatteSofwUWUP3AK5CRLg6LdrDzeccpOdsFWmqoXYwEvaJqxYMfUuo2j
         TJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788311766; x=1788916566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IXG2KCbImGkse2jGXDiJcldsNv7M/iRFg6PL2xysy7A=;
        b=sIfrOwwExwTWB7SUwoQct+6yBuoSlBysvX+vtroQ+p64eZMp6FGgvfmJbd7EkNybGM
         XyBtNrLTqsKXBo63pcilpXNiKe6gKzEhLFtVb1t7cOv/HFQMmPTVnhclLzFkeHU18Lkk
         UoiqJH3ZKtUdJ30NCwS2tvsHXX4nYu2LCeVJdQCjT0jqmUaC6bn8PFBSbUYufHTovMhp
         HSWoHCaVUr3D/MmjDrvzgIS8bMnqZPFJ22K3rEzftlen5Ud5rttQlIa9P4GuW+lQmg8D
         Wk/7AG5LM77e6NDtu6vGMUPg1ccCD4TUDrmepRM7AURfXixqQO3sgH+O14EOTVQHcACx
         iBAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpl32M3pzeuGYjHHTwy+5JUuBox5R4l7GG26T2x/hCpA2Fa0cAR7QMmjxo8qnOtLuWrM6slPpik74=@vger.kernel.org
X-Gm-Message-State: AFuF++meunqdANJBRlB530gV9mLjx20T8OEwmEukIu13YFbr2QOwY0HR
	6jA22BXrlaehyuU039v9ZaJDyYLi3LwzJ9A81a6qszpRcfuwKwROEO5CUoslhzAqDtpsFONlnt9
	r47MOd1LJHKSlnncbncXVKMFzXBwva8IafKSEMK+r
X-Gm-Gg: AYBFou3QHzbQ5oQxpGS5KBojVaY7jxI5n0RF0vXoQBiP/jSU2DLG2yWl8lHzQXpIDGK
	lL6bfZCCRpJDUOeq11tssqlNQpodg5XuAw8uBkCciJ0+jKcd/7T/tN3C5uOCNP4p7zfp9xa+Zsb
	8kABVlrzt2hAGOQ/GC78DqLH3U8JbQH3KzRZl4d6ejdcXVQItfFm38LAn3tfwk45QEXC450fHou
	RBm1CZSLuTWWfDM0r8viw3032SXffS7aM6u0iZWvBKxnt/X8qJLu+Ml5YW96b/UQY0lERzCGOMB
	i4MgoIuqODGIfet+yJg0VFVxhY231RCIfePf4XDyAz/jKvUSl0JgSdn44Fapc66LkEF6tjKllkM
	=
X-Received: by 2002:a05:6000:610:b0:47f:34ba:2d0d with SMTP id
 ffacd0b85a97d-48488dfaf77mr1818183f8f.8.1788311765710; Tue, 01 Sep 2026
 18:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825234545.2076049-1-jthies@google.com> <apVZVCzUEXp1Ahv2@black.igk.intel.com>
 <CAMMMRMdiAF1Kx9CAwZrWCiLGjrzVnoQ_Rm-m-UXSAF+fhS+y2A@mail.gmail.com>
In-Reply-To: <CAMMMRMdiAF1Kx9CAwZrWCiLGjrzVnoQ_Rm-m-UXSAF+fhS+y2A@mail.gmail.com>
From: Jameson Thies <jthies@google.com>
Date: Tue, 1 Sep 2026 18:15:53 -0700
X-Gm-Features: AcwNN1WTrRxd9fhimNdvz27qwM-VziUTihyxqgKl_8a-VrgZw7w8_yKF8fKHbqE
Message-ID: <CAMFSARfWY6k=_5Yw0S6uaPs5XzVyAJA02EuEELwu9VQEKw+2wQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: displayport: Fix OOB altmode array index
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bleung@chromium.org, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki and Andrei,
thanks for taking a look. I'll follow up with a v2 of this patch to
address your comments. Answers below with some additional comments.

> > Can you remove the above line while at it?

Will remove in v2.

> > Shouldn't that be the other way around?

I'm not sure I understand. Because UCSI_MAX_ALTMODES is set to 30 in
ucsi.h, verifying 'cur' is less than UCSI_MAX_ALTMODES will still
evaluate to false if 'cur' is 0xff. This update maintains the existing
functionality and prevents the driver from using an out of bounds
index.

> Looks fine, but shouldn't we return an error if an invalid value is
> received, similar to the Thunderbolt implementation?

Sounds good to me, but I think we should split up the
UCSI_MAX_ALTMODES check and the port_altmode check. Returning EBUSY
doesn't seem like an appropriate error code if the PPM returns an out
of range option. I think we should return EINVAL here.
