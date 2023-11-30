Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frida-re.20230601.gappssmtp.com header.i=@frida-re.20230601.gappssmtp.com header.b="ZrYaVWvC"
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7A511BE3
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 14:01:47 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9bf8964c3so19002361fa.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 14:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frida-re.20230601.gappssmtp.com; s=20230601; t=1701381706; x=1701986506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfqdBSLxG3AHh6O+/qP9RhA/+GopSJgRaP5In0OHAZ8=;
        b=ZrYaVWvC4EbUwPRDxJOx5Y8Ezxf6fbePyQFpxrGhOI3H15vHreKMldutYeXlH0jadi
         FE2O8Njse7Sb8yijR+mXdcqpaefHZ0utySb9zziNkSGE6UIWtyuhsQl3TVoQnrt0RUSu
         eRCthZiw793SiWClCr4efUd9vmkEAXChM4RDz2ThzKgONxCRbvaSFQU8GyL+e1xsoxd2
         WjBXucEw4U4DVafpB8Pf1koHrsTcyugiI/jipQqo5IAGLhxMUKvJYAihUiAjPT+Ywyfd
         Onm8KQskG5maTTIeaEblof5keqMB86cDuQW8ykk2l4YUSnppy2rUZ4tzGfYavss3fhci
         xzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381706; x=1701986506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfqdBSLxG3AHh6O+/qP9RhA/+GopSJgRaP5In0OHAZ8=;
        b=ZgTrONLe703EzZbtjXN546c3G6gP9oBc7ZHRue8cusaOy9cDfovr1csQmuknHDSRT1
         1gCE3kp8P/ioJiI2oArovfIH3hUSni2F19qRITSxIDGkZSx90fbqhbGca8OCabMzVEH9
         wKhgsQInJxx36+TAnORuiUnrItaT3HYKOkt9dISPPTQ0G6MFehq4S6fCgcgSnFPOVqcS
         cnDeKl2txvOKpy/FwhgcBzo9E98yyYeoDFnT/8F4jTpKvnRlfGYsHvLA5ugryNsgzleg
         ancZ3kIGA/gzJ9n9KabxmLFyakMWz827EWf2RdEe1UQH6NZfcsXhTKL1KeRcTNZ28Hx8
         QLEA==
X-Gm-Message-State: AOJu0YxyWm9fr5j1VNHSiQSm/75WUJwn5hQhXKYNlLFDgep/6kUVIaV5
	D74GXXwIF/cmLwlo37S7OJ9X/GxSPpsCgeKhMPdIkQ==
X-Google-Smtp-Source: AGHT+IFcmyqOUC1KsqvBv9/i1WUIJ8Op0wwBKWKzDNJzgxHFIZYud3IRdGCtVFL1oFl4JvU2ZRwgKg==
X-Received: by 2002:a2e:3513:0:b0:2c9:d862:c65e with SMTP id z19-20020a2e3513000000b002c9d862c65emr117112ljz.75.1701381705746;
        Thu, 30 Nov 2023 14:01:45 -0800 (PST)
Received: from fedora.. ([84.209.240.12])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e2e02000000b002c994a66b28sm249138lju.36.2023.11.30.14.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:01:45 -0800 (PST)
From: =?UTF-8?q?Ole=20Andr=C3=A9=20Vadla=20Ravn=C3=A5s?= <oleavr@frida.re>
To: linux-usb@vger.kernel.org
Cc: oliver@neukum.org,
	havard@hsorbo.no
Subject: Re: [PATCH] CDC-NCM: add support for Apple iDevices
Date: Thu, 30 Nov 2023 22:52:21 +0100
Message-ID: <20231130220109.90734-1-oleavr@frida.re>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CA+DmxX_N2106oTDB9izU8aAQzoVJJUBYm9M0M5d6-sxDyyxJtA@mail.gmail.com>
References: <CA+DmxX_N2106oTDB9izU8aAQzoVJJUBYm9M0M5d6-sxDyyxJtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Apologies for the mangled whitespace in my previous email.)

