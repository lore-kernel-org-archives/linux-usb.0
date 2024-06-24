Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D1519DF57
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246779; cv=none; b=eZBLXmjh6S21u2zT4tQlIzfdR2HTBtmg+qw6xqZ1ykYYa7sj0s3pJC/+iEIEC9L2YQdo7ZFOYJVX7B4moW3RW9UwXwwW4BYisgqgKNi/Z7HmVU0InbN95+/iUE1K95f/4Ho0gqPoXgsIixGTKvPMOsEOClbsoXLjG1Bh+5KGn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246779; c=relaxed/simple;
	bh=kmJtgTsgtZTlkCh8FeE1ujdxkosMVSUNwf8QsgGWP6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EC2gd7MwZjvEtNplQS3zQ0GaK9SX+uMsoNGwCBIzhIp92YbnGbTbcN5WbYVCUZY1aOepEALAylIlGdPFoeAKAMMqlOeEn6e1oVcNzaIoLMNdr9a5624Pd7g9yl1Ik+giaDhhgjF3LG8YlHgciSUSwklCmKj/OQISRVBe03U9v5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILigQyi3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILigQyi3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso44542a12.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719246776; x=1719851576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmJtgTsgtZTlkCh8FeE1ujdxkosMVSUNwf8QsgGWP6A=;
        b=ILigQyi3LBa4hmMenrdSL4FPDgJUCZawM9qsvvEGDgiaTwCGPfwEkZxQOEDs11DyNP
         pqT+l2/YWncQnbuguTrsN8IEXwsOR4jWJA5U70X/vsb1uuTh1lCFPKyzAf0kz0hyy8tc
         9/rWQumy095m3vcpAJQtNuScYT4cEAc/DuwnyP/zTX749pV47KrwfcOsOxVj7BxxPXU8
         liedgocXgQqkiJczdRsiiApzylAlZeENXC6LDVtO/im/16BzED3h975aF0wQG5zAyg3g
         1dfGVXWek6ztE7RDYxTmf7ODqUqZo2ZsOKjcDLjhWRMv3c5iuk93WnluEjyjVsEfp2d7
         yn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246776; x=1719851576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmJtgTsgtZTlkCh8FeE1ujdxkosMVSUNwf8QsgGWP6A=;
        b=H2edM4pzOrsWU5kGKWoRTZ9iNNfQu+aj9S501r2ypqaqHtjMNElaWEf/0EE+Ea2Ia1
         wjp2abA6NfDxCnoIdDSW7zf8vt5Tplq49ljlya3lNnbTKDCQXsBzzT7nR0LnOcimf14I
         39UtVW2gpQFWZAWfP49is0hslZ3VnY9KmELU6puqMGMeAwqQDnI3fZjq4NvkmWhGgJ4O
         B28nAfWYzqv8YgFfl9vYGRwNgV96ZVyECegJorZgyZt3u44eeaka3DIB7d11emorE/zX
         3NaZc8RJofPfTzGZqW8KZm1jh31ZsdHuGV4QG5z8G5zHDevlRAvjYQ/jISVdOPIZDsH8
         AdgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmOwFkUl6c7nEum+sYNFCHDroGidaDrMvAxbPGae1OS62BJe0y9SyHIcCD3QQLepAzdE+z2OAvhfaf/uZ+P2sGpjhRnjd+Fh/Q
X-Gm-Message-State: AOJu0Yyaq8n2/ukO615qcRQqtRN2i1BacoQi/vtvqNWpzt1XT3jw/gKf
	9NR2UOxnnVe5jVkRDnJ/5o6p3lXAzOAG8wAORPc4viJdR6Eqbd9lq20U04ua8ayIK8ajniyQp8F
	l1lzx2BC+l0F0asNvpYIBCtWiQu+Myf64pIZt
X-Google-Smtp-Source: AGHT+IEl5Ew5w+PWn74FGxxwXzaaD09WahDkImti/Go2baFYDXsiLn8hpTeaw26FMKmyFQ7L9WFL0AFDnp6HfsfXAqA=
X-Received: by 2002:a05:6402:2788:b0:57c:c3a7:dab6 with SMTP id
 4fb4d7f45d1cf-57d419eced6mr382420a12.3.1719246776229; Mon, 24 Jun 2024
 09:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com> <20240510201244.2968152-5-jthies@google.com>
 <21d4a05a-3f64-447a-b8e3-772b60ef8423@nvidia.com> <7b46779f-3f44-45f4-8884-2f9f625485ae@nvidia.com>
 <CAA8EJprxHq65mAU6a9iGD6Yus-VB2x3WP5Z8JWN1oUwn+zQDfg@mail.gmail.com> <bc9cd446-5e19-41c4-a316-9eb362f2d190@nvidia.com>
In-Reply-To: <bc9cd446-5e19-41c4-a316-9eb362f2d190@nvidia.com>
From: Jameson Thies <jthies@google.com>
Date: Mon, 24 Jun 2024 09:32:44 -0700
Message-ID: <CAMFSARerhgEVy4u2Guq5D_ygp5Fm4Ay6CtqjaL8iZHqJPYzD4g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] usb: typec: ucsi: Always set number of alternate modes
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, heikki.krogerus@linux.intel.com, 
	linux-usb@vger.kernel.org, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jon,
thank you for catching this. I'll post a fix to address the null
pointer dereferencing.

Thanks,
Jameson
