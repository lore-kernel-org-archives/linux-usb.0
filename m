Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B94A44AB91
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 05:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698169; cv=none; b=UEJXYnRVJ57rjes7rmvaGgp2emaJqj7styqNJc6z1jNhyV38SQFFpT+Gdj6Jq6Lqtc6cDcE7qAyuPaYWXk37rvIebzDW4riO4FtTAtPV4KbFSGRF58Xc9WunPqAPm0TwhqoAqmtifJTBT9hBoqUbCE/2RWHVnedsITgnH18dX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698169; c=relaxed/simple;
	bh=mJ5IvUT6ozRxnrHTEuPsevU+9ZsQ7VwEIaTw8yGJZWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iB7bfCqY794alzn4l+y7AYxvYjiEgrZe4/wi1e3AUdlgcJCHj4LOk8F462CmuFJ85HpFoY873FSvc7GILzcchETX8uB8eVW7+i9rZru0n95YvmPlxDlfkpZoLJ1b7NlS2yAE0roTCZph5iJYQv7knZ2yUOfzUhC9Ft3F9k2F+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=a2uGeb+G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nJZ9yJ3y; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="a2uGeb+G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nJZ9yJ3y"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 9AEC3EC0109;
	Wed, 22 Jul 2026 01:29:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 22 Jul 2026 01:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1784698165; x=1784784565; bh=ZosV19MTIQ
	yPw+aL6WljvkGqmoOhalKsabQM84koQy0=; b=a2uGeb+GpayB9MR0Z9aek6AeT6
	jxmiOGQc24W+NM1W5CW6yePxNuQP0hEsjwfoTAonT4RI/cQUjrJ/LLB0hjPX/1pD
	I0lw+YCDQp9yCH2al8Im3v4oIYRGUGcUASFrly+pysUEOjgR7q/6/84CYBcCTiTc
	jIkvZnvOwedHhy5IhK+1qWRdWF7lazZOfmC2+iJZDLZqYUmvRS2Oa+p0mPCSKwlc
	YjMZTRHYcEg1Ityizj2qUdvwXY6BOUnn7NwTd2v5kxwl/k8aoogV1LhkNTnKEbFa
	tvtlOb1hQFFuNaPhfCIW8nbq/IL4yOkTCEwHghAInHdo01d3v1JstpN82i7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784698165; x=1784784565; bh=ZosV19MTIQyPw+aL6WljvkGqmoOhalKsabQ
	M84koQy0=; b=nJZ9yJ3y1MIZ+sA/fMuZC2kHB9B059Y48ibi/A0ZKfzoi1GaMmx
	wtlunkIqHJGLjLxhW+lKD+F44z18Vj5XqJIIGM7mn0Om0fQNxlcyTCKUbuS9frtP
	+ewCGEC1tLCeczr5V25stzLgAkdenpeUnrQYw0c7ROgE/BvMsr98X4z6h6Gjt9AA
	Pc8S3rahx6lsB4MLszLPSIwbVRqkuzsu4aABYxmb4pk6TfeBu/1WAThgo62kH+vK
	GwZMwdTjhNkYcLHGLuQL7ZeD+V8EO8gLfwTL1QCsze9352i8H2IXK6IZKNGZMFNK
	xJEeVa7bNtkrof41O2H3hV0Tl0Snbclrdng==
X-ME-Sender: <xms:NVVgartxgCnOMTyiagQOyphajtLtMjRC2B4AwuHOw51urjwv1TvIgw>
    <xme:NVVgaqR8Yu3WWPHNbxnbqWTObu2bTogC4mr0ueD490CuiwUhxcKx6Nq4mFcZDtlSk
    EU--PPdD6t0KxXZ-fPrCCzx1EWfpsswmADqCkbxdA5v73GxpqM>
X-ME-Received: <xmr:NVVgapOfW1tRqivhSAVMl4dXUWORIx9uiy_ZYsHs_oDK74Kl2H5C3XCxkLI7ljcxmbNEoTRag7Cxv0JDarFa58gH7g>
X-ME-Proxy-Cause: dmFkZTEECiiG62sAloVs9UEzweSSrNfWF+isDImTXGcAgYc6pnCNZ3MYADnKcYwOtrscep
    wlCW09S8Db6FuPVUcnPP16Dk43MSPF0TnGogtKqlEXheLYlUTHCRt+xXiiGh9+ef4bNIjI
    7FF7jbA66W2uaAL4Kk2SouB6C3ahk4UiV+dY8HnITl8lwbvW0Z5scunlRjg5RMy9ikicNE
    TUNSxWbhC/t0+/HwvbYsnnPop2IUY3z+1NHC4jsmqr2aZrsx1rS6K/f5Uhnyke7UNdkHH+
    GuoGmtvL5SeC4HQiJjNdILwNZAcjjP4DlKFq7TK91cNsV2PWC5kB2S1cDYczVvjeNDnTY9
    ohLiRlbtt3bMnlAp76D/YNrmfn62/s4H699quF6mARqqnHReMGBZrLsIKl+FXl0S95OT9p
    KHrWAx4itcLH3c1XaraWxtvNwWMwwoaLL3LnXLnBm5ndJTopSR4LnaIuVy9+EeoLbZLyVB
    eLSiy8xUzR2QosPTMgUC2IReEr0hT/iLB6lJceF04IUob8O70BQZiknmIw6agBVmbMzS9U
    5d1WcynFANN36sIAsg+pq+/kgFcs1rvmMYeGW6pRcv553Vakqa1BxqWUopYxgf6O8s3kxP
    FcJIkWTiNwiKOtHsb085aWPpMkGsnQjwVcWgckJ5yfUu9P/sJxpV6AK2AKFA
X-ME-Proxy: <xmx:NVVganZRextfIf9IBOHoFCMFrU2sO5_99ODxKz9aYRCC21BKxWt9mQ>
    <xmx:NVVgarzGZHOajUCgxfFzS0bcc_rSPx0-NmHb12HbYI_ODQgWqZxlyA>
    <xmx:NVVgaqJs8gSeI3fkGqJN3HbYcA2BkhW2B1wH1g0xUWULJAY46C9zdA>
    <xmx:NVVgatpfPC3vSWV6nuLm9uocMEjjhDL1yG7-0q6Lv4_U6nDG6h6RyA>
    <xmx:NVVgaurZkw8lcLrTmRye1sR6NUJncHSkVFiYUzhHI0CzqPdfExUfQvLl>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 01:29:25 -0400 (EDT)
Date: Wed, 22 Jul 2026 07:29:16 +0200
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 221776] HP OmniBook X Flip - Broken UCSI firmware / Slow
 charging
Message-ID: <2026072254-unveiling-trunks-5cee@gregkh>
References: <bug-221776-208809@https.bugzilla.kernel.org/>
 <bug-221776-208809-vRhNVacAT4@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-221776-208809-vRhNVacAT4@https.bugzilla.kernel.org/>

On Tue, Jul 21, 2026 at 06:30:50PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221776
> 
> --- Comment #1 from David Del Sol (daviddelsol1998@gmail.com) ---
> From: David <david@david-desktop>
> Date: Tue, 21 Jul 2026 11:30:00 -0500
> Subject: [PATCH] usb: typec: ucsi: Skip UCSI on HP OmniBook X Flip (broken EC
> firmware)
> 
> The HP OmniBook X Flip (Ryzen AI 5 340) has a non-compliant UCSI
> firmware in the embedded controller.  The EC rejects all write/control
> UCSI commands (SET_NOTIFICATION_ENABLE, PPM_RESET, etc.) while
> accepting only read-only commands (GET_*). This causes the UCSI
> subsystem to eventually corrupt the EC state, resulting in USB PD
> negotiation falling back to 5V (only ~2W charging instead of 65W).
> 
> Add a DMI-based quirk to prevent the ucsi_acpi driver from binding
> to this hardware.  Use NULL driver_data to signal "broken firmware,
> skip UCSI entirely".
> 
> The user-visible symptom is that with a 65W USB-C PD charger, the
> battery charges at 2W instead of 25-30W after the first UCSI command
> exchange.  The workaround (removing this driver) has been verified
> on multiple charge cycles.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=XXXXX
> Signed-off-by: David <david@david-desktop>

Please send this to the linux-usb mailing list, with a proper name, and
we will be glad to review it there.

thanks,

greg k-h
