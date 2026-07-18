Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1A6366DB5
	for <linux-usb@vger.kernel.org>; Sat, 18 Jul 2026 05:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784352633; cv=pass; b=ijRViVLDwQy34rf5YJLp+TQwHml8iQ4O3YXk78Ux47re3/x8qefZRaPGnfc1IQ54oy3NzzT1FsW52e6Zsl347/SZNwcu0YQyeuc5kt73gqzf7LUHCfeyexUQ6QXu1UUopWcuL1MPxxBk5NQiUU4mb5BB8bA5rSWJRNiKPr5PzGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784352633; c=relaxed/simple;
	bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBx7TDt6Y5Jec8C/EuCPKHbu0KEvDHtAkXeF/AjXq9RlwS/LIdiAcVHB2rQa352w4pTwEHoFKyP2N2kNE1aN9+R01nnqR5bZBzSoVrTHQig8G3pmrEOUe1on03ms9E/mgy38rfTejUptS5eAknpImCCZrE308HfIx3pSTQA3g5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLSNAWpG; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLSNAWpG"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15c7d22070so1115472966b.2
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 22:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784352630; cv=none;
        d=google.com; s=arc-20260327;
        b=q2sMZzsgOSU9jI4lqF9I40VoHrDr7onbgDSt7S9e/aITDjn4WS3N4thrpwHv5wgRdJ
         jvfLyQ+cSJwMY9NJ55ERLY5sTmNuhhyZtFF0Y6viHEDtEdtZl6jWqk3XZp5m92e7kQ41
         WTmYMf4O722zGrv5Otmsm21DqcUbgmjOJt6mYwyxEhnQh5KXOxSVWtAqW30n3bo5nLmp
         /8gmN3mZoGPg8bAQd+++nrhtNF5LXOzXuke9Zwr7mI9wOR4gAkCtYZ27Skxm+rDo2IG8
         tvO1JZYhoyLRu51GDEyK66EL5TroszfIm8vx8i/E63Wspz9FNy0fq+YwZXm1rkCebrBO
         iIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
        fh=kmuytBiTbvjEYRcnXHMDkBYfN0H8fPlcLm9I6tZChfs=;
        b=FS4cSvR50IRNeMoDl1I7v47Hdl2g7o34LdwXFgafJmofa5t9brO8sh0DId2dXBwrDh
         vSuXE9Z+YRZG3gxiYeJwIFFb5ckuLVB7D6Fso1UhLkaxPp0EMcN1PVmobIvZ20E0a11G
         IqlYE4jm8NgQl9fNSSw2nYajeRfhJZSppgnNAVXcBOQmzztQ2EA4qPzxWWuyNcSoBQXE
         fWxRbqIPumx6/2n5r14LWAz4nBk1fB6xayr+5i9xuQ2S/mwsF+kqNnOtd0LSzOdQB1kp
         gJmAyYHNMY/L3IjnJSdz/6a+IHW1vPMxqmIoM3v8f0UIQUDom4Tmi5bPyfjpgfFKzNuN
         Iu+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784352630; x=1784957430; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
        b=dLSNAWpGn+AYA3Ja8ZBDg6U+/i+xfqMpH34m6m9kjklwRkNUmUsWx7D2/3kytFqpzw
         zqPPKFBg5mIHGSsXuoJEOLtZyOoz6XGBVzpy+w+GzXF7z0DzLgmLlEZFpAowngvaT1Zz
         OYmnhQx59SbVcbXiMBdUrGUE5fQQoMbf7/QxWKN9ToMrhf6jyJ5PAodODi6bMUtleX67
         gZXl2DIJNcd6TvPEpiUJdnXnrD8HdlwOA8t0cTkYCUYxrJGIizZW3v50+qKGFAUaz7cL
         60csjiweZU7cT+VPlBySAHD8zok8+kUydSXTTAShOkK0sY2QWt8zjjaJXsAasFOUxgxg
         nr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784352630; x=1784957430;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=St5k3xj4AeRhAT3qhfUkT73XJDbiQlQOZPv5JEO7Dv0=;
        b=tKmsO3pmAYtdG3PY1Vtn0PGOWkWgsmaNF85K79Uw6d/ETJul/qNnG004JTRDphl9RN
         UlyAy6L6wWcPMD/3ehjiVCTscLTEYvmNSKqKYHLpXjmTBRvgoB2o+U4kKLpGpEjt4bn4
         +xHWo7aTlFZXAhV/uzgRVeeLEcarfqnbaY8/W3OyTPl4tAz3IQ7WaDfV8kfQvw1bhSgW
         WaJv5mextfE0bQSOMUVRTXmZ6NmmNsKecS00NqPHQgE3cEPYi+p9C1Ll6VcTnjhois7M
         wmu+Xev3FtZwKtfuYab8FmVir/GzkfQSEBsJOuvTuGJ3sNJ1K4xQFelnq0FoCgkv433v
         PSXw==
X-Gm-Message-State: AOJu0YwnxbG+ISrkl5UZzp8vkjXxwFYdgx5NeVnC66aoXIab47QxTFRg
	vmjz29winT1yafROxE9SoPQz1j5EMc6e7CF0QJ/eQ+7HNvs8ai9b+sxSO27QTbRbaSimfmmGAng
	VPLTLz3W8kEQYCUrZPDaTVimtn85YDNo0rUVj7CM=
X-Gm-Gg: AfdE7clHcOUXsCIMtlv6XLKXzGg9FJ+w6jXD96m22z+KwIQTFrYxrdIr3SEr/WYO/T1
	qUgA+iKFS+KcOSE7cuu+RzQsQ85Qvs00C4kYeeKVaTj6OxFhlh3Si+H6qVJFlZ3XgkAPYlGgUb1
	2Gku3FmcQc8/0t06DCh8yH0NB3NgeO6Z3GCSySiI6l5O7UWWMQuXFMjkupPHJQSjhuIw985OKtn
	sz3mMdum213Seq0rLdh0WliWMkKjlJwyT2jCtPTdt6LI9lAdTN2ACh2fge1r2Xtwj4TaP+grbEX
	pjQqsm920cbSlMKc0+xlO7RtdXnnnhUPFnPcylvRr61h3j0=
X-Received: by 2002:a17:907:e1d3:10b0:c12:34ed:da14 with SMTP id
 a640c23a62f3a-c16b47ea252mr147632766b.64.1784352630205; Fri, 17 Jul 2026
 22:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
In-Reply-To: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sat, 18 Jul 2026 11:00:19 +0530
X-Gm-Features: AUfX_mxhIJFm-FhL7GTanL1EAGlmqlbs9olf-RM3hy7jEr95fa0uEkWsyyRhdQw
Message-ID: <CAFgddhJpqOO+pBrVs6U=mMOfXrO1DPTZ6XAbwPQubjYz4ZB35A@mail.gmail.com>
Subject: Re: [PATCH 0/2] usbcore: Add quirk for 255-byte initial config read
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	stern@rowland.harvard.edu, michal.pecio@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sorry, forgot to mark this as v3. This should be [PATCH v3 0/2].

Changes from v2:
- put strings in a single line
- copy bytes from desc to bigbuffer instead of pointer aliasing.
- change tabs to spaces in documentation
- reworded some comments
- drop USB_CONFIG_WINDOWS_REQ_SIZE macro
- revert USB_DELAY_INIT to original behavior. no delay before 1st request.
- split announce_device() so we can report device ids early before
vendor strings

Thanks,
Nikhil Solanke
