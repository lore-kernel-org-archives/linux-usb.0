Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679506;
	b=07ecPfuyBrq6+Jj4RRNp3BsHpqrz4NCDmaFhhiDlBe/aQxYZFRGjQ1v79c9VyA+ahJph
	 Jwo+JN7H1jD9kqLhwKXgptb2SORoAXmOnd/tXTR56igG6/MAd1C5hQkE/z9NbQz+nyvO4
	 6SQ5Yjkujoge9Ieiqy0WPbtI+ivAoWgWwQGr8sWMcFDK6A5n22/s2cl/Rf5YjfQ3thGtZ
	 nHpvCwhqH+1gR3YZE6Qi8uyyg5RoTxCh4b+sd7W7JEXAvfO7ODkAVZH2E0ggMNhvwQ+R2
	 BpcalPb3UacQF0TjoG6Vv8qCEwbA1cnXboifiJhCheagBKy11zyKOR4Vr1vby8MA37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
	b=r/yl8sL5tPX5xPdOW7PfH3eD09FnlncL+Fs4ROk+H4WrgaTXURlrrP7kxZgR+WMYMhwv
	 Lu/LYCVZYWIu+nmoWt0MkEd0jcsHsCEfS1tt8wZKvq5hxDG9VUYd1kEGOKp9pjBgmpzYC
	 2kbwnpGPbjWmznDl4CkAAdELSYxEolWjynL6vEAqAbTry1Dvl7fX01gam9qVuYHjr9g1M
	 OFSd8yRXV+HWcO1Z/wwQ8q2qnKnfxUP+v62HgZMxMzVoZ2YmVvJ24M4CpJrV2kPY/JiNz
	 m3lD/3n8vV2dZKtCCpyAy626NhpUVMq+3wlkO2TPW5XGKAyx4+4zFP7DoucnDavY+Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyMMpSVy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2444606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 04:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2444606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HyMMpSVy
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32oegT2609017
	for <linux-usb@vger.kernel.org>; Tue, 3 Nov 2026 04:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUX
	XPzT37bk=; b=MXyOblNyivzlhhDaxvbxapLabSSW4APLlwmdNnz60zphknHtWXP
	lEb/nG2i3qBSUuXwAO2cZc4GR4V7fvp28HvGBgsnQN7mVTdYh9qX6uOyFZOaK0hq
	fUsbpufi1B0TSIbS2+nwW3mALKaUO+P5iYbE5Yp7drdjcYOJKMnUrDFAN2cga4R3
	eeKk5vD3y+t1Tn91U1cqtOiQ3RktCSBm9uF1BjZCpiqiUxKqvf0X+F7ZTQbLelSH
	VgSVgAZCzRRIb8xospDrFES1BH5jzU3kIgNuz6Ctlu+vLsVNMj9XS1qpLJp03wd5
	/bLOo4cBVPd3fVdReK1qs06V9x5iWhWWB6g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d89cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 04:18:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso507270c88.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 20:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679504; x=1794284304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=HyMMpSVyg6Z3t9AbJhOBDrYyfvr4zpQ6+lOyk2aB3EFXA2jc+VoP0LDE6h/L2P0zZ7
         fpl7gkcuvUWYxpdPg2Qrw/eMsBx2YJSUVZy1+OXhuJmyhsSoghBswM/iNbOA5QPIzXvT
         Q3FK70D+TTbydiImusKCsAkdhBdHzUw3WHu3mgvUeNDV9YnH7AWSNKKiaKDEeaOWKRq5
         xGRjr3P4s7sctXuJIWgCwY1FhNiDT3ESC6Le0ZXlBnx06QeMlo5w6YCwse8f74YjfM0q
         xING7YImd6/tOaaTssMBRnY1700tIS32BiPHcepy/fQ8P9BIMRt4kqoU31lv+reHgYZ0
         H55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679504; x=1794284304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=gkN7H406ai7DCxir2sL0RPaYc/cJMwGyrAklichQ7uGyV4f4byOTGIHxuJET7d3McI
         8XHAlTbEv3+T9LHoZp/vRohX56NbNpfY+qtRPXGL9AOMqfV0AaDQs8SPtsuT5JScZu1S
         jZyEl+pQguJnX/NNltXX+LjyQhph1SQpjx98OkiNLOwDw+ZBy1RhJFtoA5MtraRi/NXU
         BhpmFj1PFng7vAH9SzHdR15mZjwEXbrq4+ARSBXQY3woacErRkpkNh8NVvHOQRDdM2Bw
         +LEVBqQxP2axFygaHtZHKTHdzVh4a78qn57Cs/NmY3aQhMLrfbArEp4QUoxqkZ9zdSkr
         BpAw==
X-Forwarded-Encrypted: i=1; AKwUvBxuaHU/gsJlLOtpLGGvqHUiVLwU5bsED8e9jB/WbARvM1F8HtJbj02GHtH9ediGB/dpYgeOrCCB6Yc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4VQVslobcfwKOV7bS/3yoAZhLxvLShFFo3pFWhXZ7BdlwAdG9
	Vm28YZ/5lcpY3c2eF8MrcIO4M67I9gT0iQicejQUSPE/RlSM5d7siCpsdzZL2TOel12lYcGTfiT
	A6krdNzHH02uxYibSULRgGAa6rCL41VnFqYme6r2bFpYc892a5ziMQxUZRjxFu2I=
X-Gm-Gg: AYBFou1Ht6WywuYppw7RTYiKGyGm0aezunxr8+ApTs1firhQJ1UgMlRy710hOOtQa5T
	aV1mVcA2O9x1BHdFxITuN4BwFyhTsPKMv+42Yu6LdkjnA4GmWHCd6iy1Ur4A5rFUWK+OyXrcUVb
	Kvn3VZ7LzPOgjfNwxBsj5tnhWDXdx7rGxHRqvDgVQ7zx/SR+O6BHxPQK8Nmh4k6nDC4dBsk/TBU
	48qVMO0Woz6UX7te2A0dCwh1KdqnjToqwTG1lA9xh9ObUvhyJDT3K1nFuYAa4Jgkz8MeX4cEpbN
	ZY0ib8bHRG7yd/jy3jnElEoW/+L6qdQB96tOUJ6xaZ4C5AHxZyV8KfM9uRO1WoEwalr7xmjLNWn
	nKWikHI1Zb7PaK3IeBVUGnRGfgUo2LgVFwwCWo2VK9oC9vDOXt1pgFSZU/WQtXAWoTzCHakDYQg
	FffFEVIWNK7THdDyR081PEi3tBYvLQLZKP
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586701c88.38.1793679504089;
        Mon, 02 Nov 2026 20:18:24 -0800 (PST)
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586653c88.38.1793679503305;
        Mon, 02 Nov 2026 20:18:23 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:22 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Tue,  3 Nov 2026 12:18:04 +0800
Message-ID: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae96090 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX6RMfftzXMmN4
 QqQxvOK+cKpD2oly2u+4IVWauDCu8TpODGOEubGlRuLCWFrO6mKtZzvUP0mVVMrkc8pMJiWVyo/
 8JNqh6PWc8X0Y/KOMb+AJrfabPfjF30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX0S2oS3pfXQAr
 mONvTwaFFgNop0zrK6D8SVwXejiDqqisbpSN5PAPJxZY8Mx2zaH6QfHexUJBTkexwOd3YoXSdEP
 3ZhsiEKJZmZGPRKx3Wjskurg7hfNdxWt0B5NeBuyaqZnAMQGrkTRcqPiEjJsAWvdvxT5K9vY1dM
 5TkLjR6uZQv+xVljkeCbTPwtoswDQ41WjwvnzFHxE7LO4d3h1JRcwCbqxH/ShCzZuZzAJI0DIbs
 P1QU5ggDqMyCJx3TgtZR6+a97pqqyr5iyUCc4pctQ4zx0ZpWNA0KVcmnKrw/OTjYOQLzwypsKD5
 t+iC3oOb2D4yFM7/a79uPoun5GnAjiZrOUrGg4pJX2zgZvsUDezSQ20iipoEfs66kJrATbcrG/h
 60QGPuLcbl+Y6RVxAegjaRjORFJjOTAHFdPdfYiXdxVpAZWW2f6QDOCb5+yPoP7rWaFwl5eiDJD
 GJNqpyQU33u7AfQcqlw==
X-Proofpoint-GUID: 8BgWfkhUq_BFNCyNWvjWYi1yYIDERD9L
X-Proofpoint-ORIG-GUID: 8BgWfkhUq_BFNCyNWvjWYi1yYIDERD9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030016

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v5:
- Hold chip->lock while seeding the initial port state in
  fusb15201_hw_init(), so a data_role or power_role write arriving
  while the port is being registered cannot fail with -ENOTCONN. (Sashiko)
- Link to v4: https://lore.kernel.org/all/20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Drop Assisted-by: LLM
- Link to v3: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 586 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

