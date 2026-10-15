Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992846D544
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066083; cv=pass; b=JKWKYlBROfA+fPpP3nHsrRaBdkCsjE36x70EqIFUz7MrnVQH5hd94t58EaSHzkB2gEenKzEu20XqavbQeOZ5xdQE/2P4n6JooPQBD0ZKt5AwejBlI/NNpA01fE9k+e8EqMlNbvdRz83ddSQR2PzwUAxuK4JqirtZuXH4b4HaZCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066083; c=relaxed/simple;
	bh=CHuR3T2nKbWyNeCG8TXa0L7+Lnah41FyiIfTKcB7elU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=TctWw4g+daF8KeLfKKaF6WsqDFo7YDPRbDObLg52pnsAKlYP39dcSNkwh7WRuHj5sxkDJjt3Dl6TEA9o9haL7qaZyrhK9t2LlEXPrBuKu/jPC3lEXKHR5hPEK4UKeSDK8aJwGCIFb/y7ALlrJn9M31chkndCHQMygquxOoIkzH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7fcMuxF; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7fcMuxF"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6799defef1eso75567d50.2
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 05:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792066081; cv=none;
        d=google.com; s=arc-20260327;
        b=K+m8HR+GewQTj0Xrkp4L4XRnARB1MY80Y2UIMpd9fWkTC9PuKxZmotJzw5DUE+UKAV
         1TyqWET2jLBzB6s7NkKAAWPRTaPAlJH3otwcP7r916+1CC8jqrRZb19ihwvy2WpF9WcB
         rnT6iYtYL4QDYkj4hLsi/KDs+G0R/pYKoYMqu/8xX2yGfVhaa0se2cie1cgBDyOUL4Ck
         MsAQyRwMs8Gm8dqaBzazUU/fIJPQcUtnnYDuomp+/djVstz90b9mxlB1peLaCYNhA/2e
         V+1xc6+7P2u/svU4tcGFfpvxiGkZDH4XWgqXAEyIEPZ6/+vvpjMG5ZK+JJU8OM+AUjOm
         1dAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9Sr1hizfvHOuqxx6DDbi0iSP3W01DP8pwpzAOeJwIpU=;
        fh=oXYrayZ9IpjhFr45KsAKgByL5LMGRlT4jqmXfv01t/8=;
        b=CnU5Lm2hRULMCHLuPNa3SriGjstGgrYpfvvncDYcVMIO2L5YVKEuXpxg4Yg3194AdL
         GvUge8oRc5FfXhRcqdnWS/9Y3GUD70KrgrxH48PQJ7xcZk2HAMXrRNKYEWxxKzEDC0hF
         EdMiLF00usPtPPRL+EfueT/FdT+7GrhZUDTAPwdhqeA944hEPef98fXOnSXtt+hm5qP8
         iboNCKmx8Xls0RiCAMS/EIb03xUnxSny5voab37+VGqRzwOr8uQpJ2BWdQDPUF5IG9He
         WFqmlllEGU+Q/3Zk+3Sw4b+tktW5sAB+HiNPK9/DpXhRnnTi660cWqVH9gZDpFYnAW49
         sEwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792066081; x=1792670881; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Sr1hizfvHOuqxx6DDbi0iSP3W01DP8pwpzAOeJwIpU=;
        b=U7fcMuxFY75Wm1ZOAk+bIO3K0BT5DyvZ6nMRrBQLHsWzIhOeO5F7h1jR3k3qDQouK4
         7QsKj++KUC6bRG8G0qJFwSeRFs6LhYVcSD9wY+CtPTAJaeaAc0H0Nm8P5mw2GZu5sO7C
         01UzkuPWLwFZDT7yoiW9mWtA1t7zcQpXt2j/uzdMPrSSYJgAX6GWJSxhN/w+yJhqwK5c
         rfu2HnDPf7Wngd9/9OiTQx4YSIf/YBsOizcRBJy8jQhLABc7/pcKybjIhLIOcxMElQ+A
         gBUrVGqMRDac1fX92y5rz6QlXKjZWhFB9JfUbEA+Ocn+88k8KhAbzYDGp4h5xg+057h0
         M/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066081; x=1792670881;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Sr1hizfvHOuqxx6DDbi0iSP3W01DP8pwpzAOeJwIpU=;
        b=JY/oocXtoiBJrRZUtMqFj96hsKbqKe2OhK0Alkgda0j8FtIB9rxCTsidM+whuhZvoV
         ZHcnuHGnEyb8uGq7UiFt9z2XYM43jg/zCM18s76vSCOJqJ8GjjKtuBSyvF5WQCXFspzY
         AAM0tQtsHHlKx+VsrGpqO4ieRov4jd3z8ZLuz5dNjIroiina53t+nm/OZGkcQRP39plQ
         RS8IvfP8IVy2NiV/LPBWu0hFvPfX1RORD9xhjndUUV6w86TFPyc/6Mp37jan+MNM8nm2
         WAcnSRUFGwOA7X22NWW5Bw1xjYn4X/SYfeXyJRnFXx8+0gSc/4E8XungjZ5AZ5cRnYYV
         uiCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF+FoCKyzszkUJihZnsHYd1NRRAI/QtvMFLPtlQHWKj1oG7Dj7dgZfysgmb0mLDasfvwLkRbP9HuY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCOZ8JXdkJlHBNsU81/eceiIFusr7Ysu3X5jbRw8d5nm9E/ulF
	JqdyAKT8YEK6raZgSWEr6K9AUEHQByKUzD/+w7rb7sItPenhHVNyNLBg8ton8eyrpRjU1K/WfzN
	2mK7gRb6VuWpAJhMBO5vtAQVGxwr4kMT3VtZNa14=
X-Gm-Gg: AYBFou05gIu4dXiB6fvjXRer6R8ACYc5HUcoKpksJnSIF2G7DHnejHa5BNPoNbf0l5l
	HSney9SiC1HyH8VYzNu7+o6R3pwj4NuRExOWmjkfiN3MlQtXbrASSY3z+emlaIGy/RoaWO03EYD
	xL2efvCsFXX67XyHI96WcGLbN6HjrHgV/Tn4o/RoMQGBuNrapLjZVPzJ6Icz8f5tW/KI1/e1qaj
	pZFxeVt9C07T++3goZoTkTcPhgStqMSHPw+qP1v7Njk/lZf0nbOpG/vtqfnMNvDoMdTwQNkLFpA
	sgrd41w98I83W6+YHH+6tyNEImQsdgvkNwM9Uy1tisdL+nVRDUCS/OA2wMvI9JR5ZSEbw9u1ng1
	Y4CjtSc7tvZA0AV+k4X1DpVylmCc9jg5ctHBdibyK5/bJYHMmDE2BvEqt3kLmWUpBptcz
X-Received: by 2002:a05:690e:138a:b0:677:aca9:7034 with SMTP id
 956f58d0204a3-67935f45c27mr11673062d50.2.1792066080646; Thu, 15 Oct 2026
 05:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGNJ+_3qpWtzjTLntxTzF2v0jU9mVssukGfhrJFOx_yb+2Abyg@mail.gmail.com>
 <2026101531-secular-entire-f7a4@gregkh> <CAGNJ+_0ShEM-G+8p3oHx1uF8rBtC7JyqmyFzswDB50qsW=qwuw@mail.gmail.com>
 <2026101509-reggae-whacking-6598@gregkh>
In-Reply-To: <2026101509-reggae-whacking-6598@gregkh>
From: Reid D <skibletz@gmail.com>
Date: Thu, 15 Oct 2026 08:07:49 -0400
X-Gm-Features: AclHuK_ul4QykuX4zlqXt3wvnHtPp9fCKeaI7wZEI-pRr6siNY0lc0ZPtQEYXZo
Message-ID: <CAGNJ+_3ug6Xs-A45-MMA5q-qHLvu=8OhbMLmVkzE_Cm6N=HbUA@mail.gmail.com>
Subject: Re: usb: devio: USBFS_XFER_MAX check bypassed for iso urbs due to
 incorrect ordering, potential oob heap write
To: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000270d82065ddfe645"

--000000000000270d82065ddfe645
Content-Type: multipart/alternative; boundary="000000000000270d81065ddfe643"

--000000000000270d81065ddfe643
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg, sorry about that.

The fix moves the USBFS_XFER_MAX check to after totlen is computed so it
validates the actual transfer size used for the kmalloc.

On Thu, Oct 15, 2026 at 8:02=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Thu, Oct 15, 2026 at 07:30:26AM -0400, Reid D wrote:
> > Greg,
> >
> > Please check out the fix,
>
> <snip>
>
> For some reason you sent this only to me, which is a bit rude to
> everyone else on the mailing list.  I'll be glad to respond if you
> resend it to everyone.
>
> thanks,
>
> greg k-h
>

--000000000000270d81065ddfe643
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greg, sorry about that.</div><div><br></div><div>The =
fix moves the USBFS_XFER_MAX check to after totlen is computed
so it validates the actual transfer size used for the kmalloc.=C2=A0</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Oct 15, 2026 at 8:02=E2=80=AFAM Greg KH &lt;<a=
 href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, Oct 15, 2026 at 07:30:26AM -0400, Reid D wrote:<br>
&gt; Greg,<br>
&gt; <br>
&gt; Please check out the fix,<br>
<br>
&lt;snip&gt;<br>
<br>
For some reason you sent this only to me, which is a bit rude to<br>
everyone else on the mailing list.=C2=A0 I&#39;ll be glad to respond if you=
<br>
resend it to everyone.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--000000000000270d81065ddfe643--
--000000000000270d82065ddfe645
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-usb-devio-fix-USBFS_XFER_MAX-check-ordering-for-iso-.patch"
Content-Disposition: attachment; 
	filename="0001-usb-devio-fix-USBFS_XFER_MAX-check-ordering-for-iso-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mv9htzi30>
X-Attachment-Id: f_mv9htzi30

RnJvbSBlM2IzMmZhZmFjMTNiYzg0MTgzNjI0ZmFiYzYxNmNkY2YzNzE5Y2FkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiUmVpZCBEb3duaW5nIChiMW52MGlkKSIgPHNraWJsZXR6QGdt
YWlsLmNvbT4KRGF0ZTogVGh1LCAxNSBPY3QgMjAyNiAwNzoyNDoyMCAtMDQwMApTdWJqZWN0OiBb
UEFUQ0hdIHVzYjogZGV2aW86IGZpeCBVU0JGU19YRkVSX01BWCBjaGVjayBvcmRlcmluZyBmb3Ig
aXNvIHVyYnMKClNpZ25lZC1vZmYtYnk6IFJlaWQgRG93bmluZyAoYjFudjBpZCkgPHNraWJsZXR6
QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3VzYi9jb3JlL2RldmlvLmMgfCAyMCArKysrKysrKysr
Ky0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29yZS9kZXZpby5jIGIvZHJpdmVycy91c2Iv
Y29yZS9kZXZpby5jCmluZGV4IGU3NzllYmRmYTE1My4uZmRiNTQ1ZTRiNTExIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3VzYi9jb3JlL2RldmlvLmMKKysrIGIvZHJpdmVycy91c2IvY29yZS9kZXZpby5j
CkBAIC0xNzY0LDEwICsxNzY0LDE1IEBAIHN0YXRpYyBpbnQgcHJvY19kb19zdWJtaXR1cmIoc3Ry
dWN0IHVzYl9kZXZfc3RhdGUgKnBzLCBzdHJ1Y3QgdXNiZGV2ZnNfdXJiICp1dXJiCiAJCX0KIAkJ
dSAqPSBzaXplb2Yoc3RydWN0IHVzYl9pc29fcGFja2V0X2Rlc2NyaXB0b3IpOwogCQl1dXJiLT5i
dWZmZXJfbGVuZ3RoID0gdG90bGVuOwotCQkJCWlmICh1dXJiLT5idWZmZXJfbGVuZ3RoID49IFVT
QkZTX1hGRVJfTUFYKSB7CisJCWlmICh1dXJiLT5idWZmZXJfbGVuZ3RoID49IFVTQkZTX1hGRVJf
TUFYKSB7CiAJCQlyZXQgPSAtRUlOVkFMOwogCQkJZ290byBlcnJvcjsKIAkJfQorCQlicmVhazsK
KworCWRlZmF1bHQ6CisJCXJldHVybiAtRUlOVkFMOworCX0KIAogCWlmICh1dXJiLT5idWZmZXJf
bGVuZ3RoID4gMCAmJgogCQkJIWFjY2Vzc19vayh1dXJiLT5idWZmZXIsIHV1cmItPmJ1ZmZlcl9s
ZW5ndGgpKSB7CkBAIC0yMzI2LDEzICsyMzMxLDYgQEAgc3RhdGljIGludCBwcm9jX2lvY3RsKHN0
cnVjdCB1c2JfZGV2X3N0YXRlICpwcywgc3RydWN0IHVzYmRldmZzX2lvY3RsICpjdGwpCiAJaWYg
KCFjb25uZWN0ZWQocHMpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAotCWlmIChwcy0+ZGV2LT5zdGF0
ZSAhPSBVU0JfU1RBVEVfQ09ORklHVVJFRCkKLQkJcmV0dXJuIC1FSE9TVFVOUkVBQ0g7Ci0KLQlp
bnRmID0gdXNiX2lmbnVtX3RvX2lmKHBzLT5kZXYsIGN0bC0+aWZubyk7Ci0JaWYgKCFpbnRmKQot
CQlyZXR1cm4gLUVJTlZBTDsKLQogCS8qIGFsbG9jIGJ1ZmZlciAqLwogCXNpemUgPSBfSU9DX1NJ
WkUoY3RsLT5pb2N0bF9jb2RlKTsKIAlpZiAoc2l6ZSA+IDApIHsKQEAgLTIzNDksNyArMjM0Nywx
MSBAQCBzdGF0aWMgaW50IHByb2NfaW9jdGwoc3RydWN0IHVzYl9kZXZfc3RhdGUgKnBzLCBzdHJ1
Y3QgdXNiZGV2ZnNfaW9jdGwgKmN0bCkKIAkJfQogCX0KIAotCXN3aXRjaCAoY3RsLT5pb2N0bF9j
b2RlKSB7CisJaWYgKHBzLT5kZXYtPnN0YXRlICE9IFVTQl9TVEFURV9DT05GSUdVUkVEKQorCQly
ZXR2YWwgPSAtRUhPU1RVTlJFQUNIOworCWVsc2UgaWYgKCEoaW50ZiA9IHVzYl9pZm51bV90b19p
Zihwcy0+ZGV2LCBjdGwtPmlmbm8pKSkKKwkJcmV0dmFsID0gLUVJTlZBTDsKKwllbHNlIHN3aXRj
aCAoY3RsLT5pb2N0bF9jb2RlKSB7CiAKIAkvKiBkaXNjb25uZWN0IGtlcm5lbCBkcml2ZXIgZnJv
bSBpbnRlcmZhY2UgKi8KIAljYXNlIFVTQkRFVkZTX0RJU0NPTk5FQ1Q6Ci0tIAoyLjUzLjAKCg==
--000000000000270d82065ddfe645--
