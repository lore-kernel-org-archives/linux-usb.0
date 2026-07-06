Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C61A44DB7F
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341920; cv=none; b=Qa1c71xxYAM1KlJBCZKKDEOLbG6p/IGr4mNgrqqODPVkMR9IxZgaq606DGOJZLz+w+N4QUhDT1k+wCLqoelqTEDirIsP5Ilgq/p4vAx1VgqlsxqD/CWbh41o0HzdhMWommYKX6c5F08epjKJLBbUw9eFrtqoIi0OsxmztoEd4vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341920; c=relaxed/simple;
	bh=6LGnnQUilPleWEktfrY4MmM0pkVSQym5Tb6K8ulPQrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ueab4pz8Hp6FhPgmUw9UEHC3U9yDmLqCSDy18uoiSolOUxVfci4NeJAWANGcAKdKSj4K1+EoAQIIpr2uQQWrcX9QPncB8seb4/y0yY6L+qScgdzzEgwHNd7w6XcdEHtN0FcNGAC2LL9mYEY/rXR1Q8+q9mrURARWTNlkK/sxj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eMDmEatA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYUKA9xo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eMDmEatA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYUKA9xo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJQC316461
	for <linux-usb@vger.kernel.org>; Mon, 6 Jul 2026 12:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+yUr04oywdz4IiOeMls1g7Xd5wgtPGT8YOwPRuyxOQ=; b=eMDmEatA+mntEhDP
	hJg0kYY5ngJKUD2HA6tUAT2pLblN/xbU0CHq6sj91iqZnEeZnVgd4vAdeRzGzMWY
	uoo5jiozfbRr90ky/IFTfnLovnWUDoT7RUSNvkuDAZWQePbASpj3sw68yWJWM0qT
	0zUz2Wp5rOpE879XRKdogY74+OkmzM5N1apchnTZ+Nojt8ltOW3B/faaBbHJL9cG
	4jJVAQNmAfMRAxJpiGEgKfBeyWKKSI3b2Rw+EBZx7jY3ORuS44gDyPy2GjPlm6I7
	uPoAwm/ZJ1ggoI/y2XHMHjZvHWMWw8lpcFwOAfkpMuBrlOvDZchrNOk+iUe4/Jy3
	6voEyw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7h8ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 12:45:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ee2847cbd4so35195846d6.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 05:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341900; x=1783946700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+yUr04oywdz4IiOeMls1g7Xd5wgtPGT8YOwPRuyxOQ=;
        b=AYUKA9xoOMnrjyYQxUpt6t/qB5cbGOm/itGzPgzOt06/XXALKVLgmWCasENr9IuwM9
         prLQBb3+ByZFcxEsHbsE217jtTOI2jh8RBPOF3yTZlmTzfqecN9MrA35rItVPdRzTDAk
         EAe5srBC2CWoG5aGvR+DEuHW+Lx8GWRkGZqgbTqGTPYnPAyAZR3GIsh45eSG27RXC/Zh
         0JFiGvEQPFe2WTyo7Da8o5tivW11xpu0lnI5++/nUE5oRjCpsYhrbbIpJqrS3vWZMWEG
         W2BjdUDhWdalhnlUv7brXkW8ACejrISiR7FEI9i18lK4e6BeRAOGybmKKtfLkdJahZCa
         uyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341900; x=1783946700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+yUr04oywdz4IiOeMls1g7Xd5wgtPGT8YOwPRuyxOQ=;
        b=n2ClMqeYmUWsDWZLt5Tav1kC6XEge2tHdI/2wwI3n/sFWReSBQYWhdnZzuSGruMrkV
         pq2VaDKHB5hSnqMqIbwNIuiEyELLRaY+nwZLSQkxEvtZjRGBm0mbLOWmf8juBfLBPeZW
         0GSyTIsHAVfb0VhvtLm2Podj9XxkUUnISJH3X8HQneJP06WEacd2i06MEva7T+Wqjj24
         fAmMBImcY3W6U7PbRuTFt2/3TfOQ87Ck8RKvCNjRz9Jv3IXDESwmbTHC3GkATSXRP3VX
         wmiMpRSF8vsL6xnpzTyEMmsDJQVJoyeceFp59FG3EF3wa5TGdB3XQwB/gnPlMCerjyn8
         x8AQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0/sf8DBptUM1iCfIRmB0zS9kgrwMhtuwIekAh29myBXQI1b2aeUt/2DfPBrJNzLjS3gvhi+9lzAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIviY0wvDmVrUQbE6rtkGBufkrKGyFOpXTF5O70sC6eeRmS1lW
	mO5bBeFPPJdufWb5zFHr7gM4k5FAEjVJ1tKkASj8RlR4H9F0CFms1071W8mQaUFom6TBF5TBb0g
	tJa3veh7X+9Vh3EhFeM04fpkHIP7xTi0DvXoUEljoO+E2edSQAsnClu40ggTbyGs=
X-Gm-Gg: AfdE7clDj++oz42hyPLN8MmoEMm9JwOksnklBd/ootfJ5EYffCWjiNEGajyBXWxTMlM
	9BGzVna68fci2qlhPFYSuQ0eQn8b0vG3P+8yqXjZ1ZCzVjoKxFe8k/VuClGl9JMMA23kTQ8lEEW
	12qIgYUvxpcYfpOPgwv2k3fpYgvIoWhvsYTSCEKClxWFGdMVYj9zzpDTON+htyI9tIsHzULaSA9
	l5S8WL28u67nD2PXRoKM1r3/zLnMML6lWt2IvAVE3sDTrhr5WCM+wIy2n8q5TNDKY6GQ7i5kbTf
	e8KY87tUhj8qtDUpC9TEIzovSWZGuIGXiDZ0Ir1iJjSUOECv1B+yPUc5g1jHbE3bGLzB8V6p9vu
	3tmhTMryLUXgr7PnA9Z5rTQAC4s6nRsh+/PksmqZ8
X-Received: by 2002:a05:620a:3188:b0:920:6061:816d with SMTP id af79cd13be357-92ebb3a6413mr53868385a.0.1783341900175;
        Mon, 06 Jul 2026 05:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:920:6061:816d with SMTP id af79cd13be357-92ebb3a6413mr53854785a.0.1783341899137;
        Mon, 06 Jul 2026 05:44:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:44:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:15 +0200
Subject: [PATCH v3 03/20] driver core: platform: provide
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-3-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2811;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6LGnnQUilPleWEktfrY4MmM0pkVSQym5Tb6K8ulPQrE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MwrXJyI6RDGXR5NSdFZ9xrrITGBOlOKRSQ8
 YpbXqH2OJqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMAAKCRAFnS7L/zaE
 w/sdEACHAvXLRsU5RV7NL57uR65UVTNYQntV6UGg875BqJxWEvlWfG5SidW+TTr1zGmNWyjwn46
 INxrqYMa02CNieMK5mjLiVaCZWsT1rjXF4OV7zMxUVU9DUkdO4QBiRa6mKZxZHP3qGTcCxK3Llq
 e36oYe9K/9tuGsUmHfogfwxzw6/UIy6Ka89reeczHeRntzFRJpF5TzeDR4T9Vn+z2COOIOy1TPN
 z0/I7QxhkhBmEIm4nhai3oxZGwahkI4CuOrWnohRoujcTlcqg9HHOX5WjfsVRtICbbKFPeQ2wEq
 l+ip9n1y1FL4wuvfQ7VWQigZelfqoka9z0v4ffxsbuMDuZeiOa8dQrBBYoKXZCPTQzX0xhte7Rc
 wLGFEQQnwWVRnmtBjioxssuPAjm/gcAb6ypAO0j8u3ia/6k8jE+6y0ZYpKaDgn7zijlJDPxnyO+
 XFuvWhjfn8yjrT3vF4AmdyxWAszTaUzOfOhTuKMT3cWnj8bJpq4U6GXpv5nztKgHa3iFNntWgl8
 EWhctNRgB+bsLrCzsSwhtoPFZghiAWba4tq8OYctcOhetLOekXjehwdI+MTyoHAYlY2O4bCLNyF
 uBpojQHZsf65MVPDsAHKEHy357eeHVezaSVNZiicNTo5wwdMB5ghmjRAg2WUP8MB1nXUoK2zDEB
 zgEguOOlSD8tZqA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/8G1Fzph72xB
 9D+PAF1RazgEdbY88b6UMM/rEa9YoiKw5LDLDCI08KTbjVIXDMLFmmMo8UTCBS/62siaDVVrqA+
 ksJgyJglfPt5w0FmUYe+MVXHQWLd3AexrkUFfcUhc7JFByMECH5HS29ra4MsNSWNIvHzDGI/Ka1
 GOYAzcvFF5Hkor1GL5Qr8/zqzyXFimcWRsgSlDXGlR7iNhx3JHd9zVCBqk7dYi7kmL8lDcjpNJc
 HIBnqk93hogz+zGL7pvpQAf31AYFIxTmcLjcMA2TMoHzTSYOYB24BZDbJp0cpfFWYr9iuz3M+Kh
 TlVGRiX9ctCY/PE8NTXvQGK+GEfBXfnm8KkpC56OlgcbJ/JFFNjxw51FUWA4YWcelIWn+AVg3uU
 kJujOusNUNUDWj/sTaXd7Hjq5nSJKNRYWx5lAXxvOyAYL1dzbSWK6YZN1D6KoKKqacFurfSlkYi
 hrwESaXfs31cx4HomCQ==
X-Proofpoint-ORIG-GUID: T05eHacDLl4RmdYu_LL8jVwAqhdO6j-6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX2gROfvpMrn9O
 2ygRNMF49ztMb67MdYIkGySF6KToKCPb5hANME6aB57cbQcUgrONiA1kqyGJTMJPjboRyrJm/FB
 rc7hajdzKnfdm+yn17zgTknzMKXHg0A=
X-Proofpoint-GUID: T05eHacDLl4RmdYu_LL8jVwAqhdO6j-6
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba34c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=7s1i5lxVbzGmBzMXG7QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Provide a helper function encapsulating the logic of assigning firmware
nodes to platform devices created with platform_device_alloc(). Make the
kerneldoc state that this is the proper interface for assigning firmware
nodes to dynamically allocated platform devices. This will allow us to
switch to counting the references of the device's firmware nodes in the
future, not only the OF nodes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 19 +++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 3188d5aba5f90622f821c695049cacda030204fb..6520b70cf3052d683a2ecb1a0dd7227575546ba0 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -711,6 +711,25 @@ void platform_device_set_of_node(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
+/**
+ * platform_device_set_fwnode - assign a firmware node to device
+ * @pdev: platform device to set the node for
+ * @fwnode: new firmware node
+ *
+ * Assign a firmware node to this platform device. Internally keep track of the
+ * reference count. Devices created with platform_device_alloc() must use this
+ * function instead of assigning the node manually.
+ */
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode)
+{
+	if (is_of_node(fwnode))
+		platform_device_set_of_node(pdev, to_of_node(fwnode));
+	else
+		pdev->dev.fwnode = fwnode;
+}
+EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index e9f7baceeb4c8269dbc0143c4d8fc9d73ba024ca..f037e4101c41dfdbf628d013348d7149ac519721 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -21,6 +21,7 @@ struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
 struct device_node;
+struct fwnode_handle;
 
 struct platform_device {
 	const char	*name;
@@ -266,6 +267,8 @@ extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3

