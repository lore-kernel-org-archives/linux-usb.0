Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n3BbqBmW"
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B850DC4
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 14:53:20 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3594149e3a1so765535ab.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700088800; x=1700693600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a3cY2tNS0EuD6xrF38Kd/4n7z/7U0EGExpfVo9Y2hIk=;
        b=n3BbqBmWKe1WPukvzgj28IxTfZ8SrYHzyhoV5IemXrP+JLDILOvSJy5M8Y0DbovzLR
         HcUZvxE2chftDbk50SK2N/u4zxt4n+tb+UBb0XiiqzsV85DknqrKWtSBjj8SCsz83Pli
         oodUeVlQoWi5s3tT9JPqhup4cONS/2qw6x3vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700088800; x=1700693600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3cY2tNS0EuD6xrF38Kd/4n7z/7U0EGExpfVo9Y2hIk=;
        b=tDRTSp/wrMezniGOt7aVYmN8rUcjhqv//GmSCrp9I/7Vc/yFjmCR8vObKzlYzro3/O
         8r3YaAXlV3jAAhcFuIJumeQtyJUcH3+QhRFhvQpIBGYXvsKAJOfA6HhP7s3IzX/h/Qt9
         aqi5tG4/+JBXpoJKRIS1K2fqX/sN65O6dC0DorR0Xyj4kv3Gejkoy78GUjHNthYWwdId
         QELLlWXxrMIGYTMxfazeqyh7R7qgjObNxxyV+8HTjDKaqm172/lt0XXj6zlMZS0vaTg+
         7HkDgJg/lJKyUh9uzqk8xnqsDpUJmILlQeISRGnhi10UVnXQX22Cv9aTbEBEUrlqEa3+
         AOkw==
X-Gm-Message-State: AOJu0YzdzxtXZsWmH4tvWaAU4FCkAKa1l3j6Xl68NUYtAw44gRS5r58k
	gUmo2mvAr+7k85mkIuhRL6G8dA==
X-Google-Smtp-Source: AGHT+IHa+L3O0s1sj7TkY3wIwz5KszbvhYt2NuThs976jvnb7E8qw9L8E0jM1KeA3+Ck357KNPQg/A==
X-Received: by 2002:a05:6e02:1ba3:b0:357:704a:8699 with SMTP id n3-20020a056e021ba300b00357704a8699mr20397824ili.8.1700088800154;
        Wed, 15 Nov 2023 14:53:20 -0800 (PST)
Received: from localhost (74.120.171.34.bc.googleusercontent.com. [34.171.120.74])
        by smtp.gmail.com with UTF8SMTPSA id 1-20020a920d01000000b00357c06be898sm1403243iln.81.2023.11.15.14.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 14:53:19 -0800 (PST)
Date: Wed, 15 Nov 2023 22:53:19 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 2/2] usb: misc: onboard-hub: add support for Microchip
 USB5744
Message-ID: <ZVVL39UtYmeCIT8n@google.com>
References: <20231113145921.30104-1-francesco@dolcini.it>
 <20231113145921.30104-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113145921.30104-3-francesco@dolcini.it>

On Mon, Nov 13, 2023 at 03:59:21PM +0100, Francesco Dolcini wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Add support for the Microchip USB5744 USB3.0 and USB2.0 Hub.
> 
> The Microchip USB5744 supports two power supplies, one for 1V2 and one
> for 3V3. According to the datasheet there is no need for a delay between
> power on and reset, so this value is set to 0.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
