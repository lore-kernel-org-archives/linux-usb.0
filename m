Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BE1364022
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 03:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505328; cv=pass; b=fXl3fxIYYhPfFcT5mREcDVWwbU5A5uEKGKFR36qPEK2zjEUVA7diLNTXR2WFDOZGTyv9x+rw2K/P7vMjHilReQ6UyAUKF1tr+beLYk0Eo/i1ij2+aoq6tbZ8clgfU1EUzDI8koMRaWRVC8BBkF6xdGvXvgDJxjq7IlK7esfYrtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505328; c=relaxed/simple;
	bh=hFzgByS6bi5kTwwi7O8DAmM80iUm2D2izFyPPAtbNYQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cYPupcrz/+n3Lb4DocDD3L+wCV0Lat35VFZyr4wa3rytbIbF5qG5ynivgEijQB72rX7364rUhslkVFMdEb2gHCgqR7tRjMo7R0+4BHYoC7r8F6akY4hfoWQUdJqlMuA3xMQWRkhiUgP7JXt1WjiA/DkTYq1kb+LiizlOQ3cbEeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtUcIPwT; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtUcIPwT"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66771ded50aso840870d50.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 20:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786505326; cv=none;
        d=google.com; s=arc-20260327;
        b=QgD/t4TICIjeA75BtuXpuelV8l45+BXuPVUjjgoOd3f27OlwD7hDQyOU5dC549gDSp
         pZcEqE5peHwKuAd3oRSFBx5igbZNh7cENMgP7IHCiG7/gJshZbnJesYNpBRmE/Ow9Ewf
         VAxXXGFVhablTR8XIT5CEYviW/PaF4yZS8eQIFBGq7CSTi4sige3ZGs08rPs3aM/vEdX
         RpJ1+y0a7gvUIvpuhF7ALp2YpqOLmSzmfGB2AjkOsjruHPhxYge9fuY5t3ilAlbUeNmm
         A5xJcEqHuT7Nc/bd+cfBaj1ugLVr1SVcGMmBMwvjMliQefDMNJIi3M/GDjI7r5o2sDTS
         oK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3x3ljB1/5jZGvMK+xKcmNMNUG38LdqV4gbBC5pUVMDE=;
        fh=qRzOhPfL/9ynYYukUUeqSji1zGZwBm1oarSag5rjc2M=;
        b=JsLpCCyy/Wo2rOSCmmpY/8u5J1DN9c4JS2VXO2dl16kAG8oFkgp45Ndb2uwc288fMR
         bV4VSByoiH8kjf0WGMgIbCsnhl1H6J1Oj1/X5aTRzwEBE5/QPT5Ctw55gld4s3TnJUJl
         U3twGkeeBmuGvNfUnhIxom22HSk79BtqOoi10n9yonZhRoUDplJpUgnYV7/TzPCk9hcA
         TMfi4e1tQ7G5e/zLZu/8/kASEYMkghJFL4Wn8ol7WGLqZWCOV0bqQnpvOo10IqW6cKm4
         8JURZ0qaRALvf3Bku+vhCPNDxhceOf3AMSxbGTfYM2zgAPmoKDlWaUCjv3w+EM53E+gJ
         QM7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786505326; x=1787110126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3x3ljB1/5jZGvMK+xKcmNMNUG38LdqV4gbBC5pUVMDE=;
        b=XtUcIPwTZycFAWCsfQTxD2tq+Lkpd5SN/Wf8fbv3IN5CsJDaSe9teKNm/gePANMWh4
         /trW2NJq2kM2DgwNdRvueUmJvppqJF8TgM4CkuwdKTZ61RtmJqKjUy8/iha7V9rssRGo
         Nw8sra7LT8jRDFBbsE38mpPVsPj1DcsVuVWd9kE1lIynjNi+rX3jt6xov0kJdwcksT06
         c9iysBhP6akw5ZpTHlofsXJFgfR8KrCpa74udzXmSzuEeMizZJylqRHSEpVyyGQ6wQKA
         Ys+NMy3EbvG2PGWnqVuQwkF4zmumplAlLRNvGi33zBVW7w5urw75VnFi1GMsuEM/EVGf
         9Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786505326; x=1787110126;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3x3ljB1/5jZGvMK+xKcmNMNUG38LdqV4gbBC5pUVMDE=;
        b=fAKqQKhgZv5CDxVkFa5KNxStMOOhncdcfgvCcWQve4F0UtV2eBArAUTc67gp+4jHUt
         l8AiWP6TP/INxF9qWinV7dtj9rii5mzA/W2aJaD7i9rIqV/RWdu3cfVbth5kXg78DFEh
         90GhFzoUj0tDeYSXqMfUwj7iiykNIVt3GgTpWOnHC+E+u7znD6ym/ykaVe1WHgDSs6cv
         bJqUvii/lHVbsd/vvz0Xv2B2wXewAH18HkRWzhJKxUxZuTxi52JdaHyR6sRJp6p3QyaW
         6l1vPyO2iQ2kM8iuMV/9vz/SSX8K7cscBkDeR1AkSMmfFKEPvqpJs4mMktYCPDGffs4m
         WDGA==
X-Forwarded-Encrypted: i=1; AHgh+Rqv+tMW1bDz6XVkQE2xY2U6CjEs4HnvP8vS3KezX4d5GukN5abc7aC1crzwsKj8ck8K++MU6Js1fas=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYbDxbteSyhG05R2NH1Kw+XpuYyG/SQILidQ8FQU8JJticVii4
	vWB7Zz7qswC7mmBLyzbKe0GwaaJ/Y30IFf9MLP1GBLvj2plINlCMjyxyvQ0iofUCODdMZKz99Nv
	PhO17uSfiz/WecGwHord1X7OKhiK2T2Y=
X-Gm-Gg: AR+sD10H2gNUmXCn6VDwUEwB0paymKQoQBM6Sp4d7H4F7TV7OKwlH1LAsNKTnZBR/dk
	P3sq85UtkvZVH279ylNV9QAeXCDpyl03hGe+wQChA5PB96XjCmodpr4nUAYgW+VHxaAOw0/gSAU
	R70qpQL54sbFh3lOHb544lNK84jPqVQQHKbDV6qkx+JW8JhZdMUZSWe81wKJ6qO76+77TSx3Rkb
	sx0Dihc5iP5x3KNpPd4dVIFgdWYffTasjYlIHC8MzRXQmdHq3aXBpYtJPLgpnvwBn3wdkuDNMOW
	lArrGMf7j91sk8UUfLFcQi9mrZs0XJVpfGjlfbd2edwDeEKxFhQQ5bGanDOYfIUybSoyrpnOW5a
	Ot/032OXv6srWks3G4BM8DGLZm4YU16nOMuGdD3PU/gpynUiNnRT3QLzHOuAg5IjUhS8tmG8tl4
	EuWwfsEkhAEnxq
X-Received: by 2002:a05:690e:e83:b0:667:e04a:8a30 with SMTP id
 956f58d0204a3-66b33ef1462mr992132d50.20.1786505326485; Tue, 11 Aug 2026
 20:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Tue, 11 Aug 2026 23:28:35 -0400
X-Gm-Features: AUfX_myX4ikitz6ENF2ELu8gUjOPLyTbs5oNiidFWnVNdInB4yOw_nKrcnjo4hQ
Message-ID: <CA+Z0x2L_j=HaZO2_YwVSe2WtRYwGFu-EPOWJLHj9_AWC7wesUg@mail.gmail.com>
Subject: [PATCH v3 2/2] usbip: apply list options regardless of order
To: Shuah Khan <shuah@kernel.org>, Valentina Manea <valentina.manea.m@gmail.com>
Cc: skhan@linuxfoundation.org, Hongren Zheng <i@zenithal.me>, Greg KH <greg@kroah.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

usbip_list() acts on -r, -l and -d as soon as getopt_long() returns them,
so any option parsed afterwards is never seen. -p therefore only takes
effect when it precedes the mode selector: "usbip list -p -r <host>" is
parsable while "usbip list -r <host> -p" is not, and -l and -d behave the
same way. Nothing in the usage text suggests the order matters.

Record the requested mode during the option loop and run it once parsing
has finished, so -p applies wherever it appears on the command line. When
several mode selectors are given the first one still wins, as before.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
tools/usb/usbip/src/usbip_list.c | 31 +++++++++++++++++++++++++------
1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_list.c
index b9d60b87e47..632a968a088 100644
--- a/tools/usb/usbip/src/usbip_list.c
+++ b/tools/usb/usbip/src/usbip_list.c
@@ -343,6 +343,8 @@ int usbip_list(int argc, char *argv[])
};

bool parsable = false;
+ char *remote_host = NULL;
+ int action = 0;
int opt;
int ret = -1;

@@ -360,19 +362,36 @@ int usbip_list(int argc, char *argv[])
parsable = true;
break;
case 'r':
- ret = list_exported_devices(optarg, parsable);
- goto out;
+ if (!action) {
+ action = opt;
+ remote_host = optarg;
+ }
+ break;
case 'l':
- ret = list_devices(parsable);
- goto out;
case 'd':
- ret = list_gadget_devices(parsable);
- goto out;
+ if (!action)
+ action = opt;
+ break;
default:
goto err_out;
}
}

+ switch (action) {
+ case 'r':
+ ret = list_exported_devices(remote_host, parsable);
+ break;
+ case 'l':
+ ret = list_devices(parsable);
+ break;
+ case 'd':
+ ret = list_gadget_devices(parsable);
+ break;
+ default:
+ goto err_out;
+ }
+ goto out;
+
err_out:
usbip_list_usage();
out:
-- 
2.50.1 (Apple Git-155)
